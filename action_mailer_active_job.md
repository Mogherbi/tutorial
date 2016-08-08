#Action Mailer
```
reference: http://guides.rubyonrails.org/action_mailer_basics.html
```
1) generate reservation mailer
```
$rails g mailer ReservationMailer
```

i) app/mailers/application_mailer.rb
```
class ApplicationMailer < ActionMailer::Base
  default from: "xxx@gmail.com"
  layout 'mailer'
end
```
ii) app/mailers/reservation_mailer.rb
```
class ReservationMailer < ApplicationMailer

  default from: 'xxx@gmail.com'

  def notification_email(customer, host, listing_id, reservation_id)
    @host = host
    @customer = customer
    @listing = Listing.find(listing_id)
    #once customer reserved a listing, it will send email to the listing host.
    mail(to: @host, subject: "You have received a booking from #{@customer}")

  end
end

```

2) create respective mailer view template

app/views/reservation_mailer/notification_email.html.erb

```
<!DOCTYPE html>
<html>
  <head>
    <meta content='text/html; charset=UTF-8' http-equiv='Content-Type' />
  </head>
  <body>
    <h1>Congratulations! You have received a booking from <%= @customer %></h1>
    <p>
      You can see details of the listing of your reservation here: <%= @listing.name %>

    </p>
  </body>
</html>
```

3) Not all clients prefer HTML emails, and so sending both (html and text part of email) is best practice. To do this, create a file called notification_email.text.erb in app/views/reservation_mailer

```
Congratulations! You have received a booking from <%= @customer %>

You can see details of the listing of your reservation here: <%= @listing.name %>
```


#Active Job



```
- Action Mailer is nicely integrated with Active Job so you can send emails outside of the request-response cycle, so the user doesn't have to wait on it. Active Job's default behavior is to execute jobs via the :async adapter. So, you can use deliver_later now to send emails asynchronously. Active Job's default adapter runs jobs with an in-process thread pool. It's well-suited for the development/test environments, since it doesn't require any external infrastructure, but it's a poor fit for production since it drops pending jobs on restart. If you need a persistent backend, you will need to use an Active Job adapter that has a persistent backend (Sidekiq, Resque, etc).
```

4) Insert gem `sidekiq` into Gemfile
```
#active job
gem 'sidekiq'
```

```
$bundle install
```

5)Calling the Mailer in controller
app/controllers/reservations_controller.rb



```
def create
  ....
  .....
  ........
  if @reservation.save
    ReservationMailer.notification_email(current_user.email, @host, @reservation.listing.id, @reservation.id).deliver_later
    # ReservationMailer to send a notification email after save
  end
end
```
