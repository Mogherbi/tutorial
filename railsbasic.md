- To create model & migration at the same time

```$rails g model listing name:string price:integer ...```

```$rails g controller listings new create edit update destroy index show```

```$rails g migration create_listings```

- config/routes.rb
```resources :listings, only: [:show, :index, ....]```


- `app/views/listings/new.html.erb` OR `app/views/listings/edit.html.erb`

```
<= render 'form' %>
```
- form has to be partial html erb file


- app/views/layout/application.html.erb
```
<div id="flash">
    <% flash.each do |key, value| %>
    <div class="flash <%= key %>"><%= value %></div>
    <% end %>
</div>
```

validation of email:
```
 validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
 ```
