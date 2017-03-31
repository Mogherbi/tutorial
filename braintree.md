
reference_link: https://developers.braintreepayments.com/reference/general/testing/ruby

1) gemfile

```
gem 'braintree'

$bundle install

```

2) Setup Braintree

A) Sign up braintree sandbox account

B) Insert ID and keys into app

config/initializers/braintree.rb

```
Braintree::Configuration.environment = :sandbox
Braintree::Configuration.logger = Logger.new('log/braintree.log')
Braintree::Configuration.merchant_id = ENV['BRAINTREE_MERCHANT_ID']
Braintree::Configuration.public_key = ENV['BRAINTREE_PUBLIC_KEY']
Braintree::Configuration.private_key = ENV['BRAINTREE_PRIVATE_KEY']
```
config/application.yml
```
BRAINTREE_PRIVATE_KEY: 'XXXX'
BRAINTREE_MERCHANT_ID: 'XXXX'
BRAINTREE_PUBLIC_KEY: 'XXX'
```


C) insert braintree js source

app/views/layout/application.html.erb

```ruby
<head>
  <title>ssy pairbnb</title>
...
...
<script src="https://js.braintreegateway.com/v2/braintree.js"></script>
...
...
</head>
```

3) Payment Model, Migration

app/models/payment.rb
```ruby
class Payment < ActiveRecord::Base
  belongs_to :reservation
end

```

db/migrate/2016xxxxxxxxxx_create_payments.rb

```ruby
class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :reservation, index: true
      t.string :braintree_payment_id
      t.string :status
      t.string :fourdigit

      t.timestamps null: false
    end
  end
end
```

4) Controller & Routes

```ruby
class PaymentsController < ApplicationController

  before_action :require_login

  def new
    @client_token = Braintree::ClientToken.generate
    @reservation = Reservation.find(params[:id])
    @payment = Payment.new
  end

  def create
    amount = params[:payment][:total_price]
    nonce = params[:payment_method_nonce]

    render action: :new and return unless nonce

    @result = Braintree::Transaction.sale(
      amount: amount,
      payment_method_nonce: params[:payment_method_nonce]
    )

    if @result.success?
      Payment.create(reservation_id: params[:payment][:reservation_id], braintree_payment_id: @result.transaction.id, status: @result.transaction.status, fourdigit: @result.transaction.credit_card_details.last_4)

        redirect_to reservation_path(:id => params[:payment][:reservation_id]), notice: "Congratulations! Your transaction is successful!"
    else
        Payment.create(reservation_id: params[:payment][:reservation_id], braintree_transaction_id: @result.transaction.id, status: @result.transaction.status, fourdigit: @result.transaction.credit_card_details.last_4)
        flash[:alert] = "Something went wrong while processing your transaction. Please try again!"
        @client_token = Braintree::ClientToken.generate
        @reservation = Reservation.find(params[:payment][:reservation_id])
        @payment = Payment.new
        render :new
    end


  end
end
```

5) Create New Payment Page


app/views/reservations/show.html.erb
```html
<h3>Your Reservation</h3>

<ul class="list-group">
  <li class="list-group-item">
    <p>Listing name: <%= link_to @reservation.listing.name, listing_path(@reservation.listing) %></p>
    <p>No. of Guest: <%= @reservation.no_of_guests%> </p>
    <p>Location: <%= @reservation.listing.location %> </p>
    <p>Check-in Date: <%= @reservation.start_date %></p>

    <p>Checkout Date: <%= @reservation.end_date %></p>

    <strong>Payment Status:</strong>
      <% if @reservation.payments.where(status: :authorized).count == 0%>
      <span class="btn btn-danger"> NOT PAID </span>

       <%= link_to 'Pay Now' , new_payment_path + "?id=" + reservation.id.to_s, class: "btn btn-warning"  %>
      <% else %>
      <span class="btn btn-success">PAID</span>
      <% end %>
  </li>
</ul>

```



app/views/payments/new.html.erb

```html
<h2>Payment Page</h2>

<%= form_for(@payment) do |f| %>

  <div class="field">
    <h2><%= @reservation.listing.name %></h2>
  </div>

  <div class="lead">
    <%= f.label :from %><br>
    <%= @reservation.start_date %>
  </div>

  <div class="lead">
    <%= f.label :until %><br>
    <%= @reservation.end_date %>
  </div>

  <div class="lead">
    <%= f.label :Total %><br>
    <span class="label label-warning">RM <%= @reservation.total_sum %> </span>
  </div>

  <div class="field">
    <%= f.hidden_field :reservation_id, value: @reservation.id %>
  </div>

  <div class="field">
    <%= f.hidden_field :total_price, value: @reservation.total_sum %>
  </div>

  <div class="field">
    <div id="dropin"></div>
  </div>
  <br>
  <div class="actions">
    <%= f.submit "Pay Now", class: "btn btn-danger"%>
  </div>
<% end %>


<script src="https://js.braintreegateway.com/js/braintree-2.22.2.min.js"></script>
<script>
 braintree.setup("<%=@client_token%>", "dropin", {
   container: "dropin"
 });
</script>

```
