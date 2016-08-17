reference_link:
```
http://rails-4-0.railstutorial.org/book/updating_and_deleting_users
http://www.w3schools.com/bootstrap/bootstrap_pagination.asp
```



1) Gemfile

```
gem 'will_paginate',           '3.1.0'
gem 'bootstrap-will_paginate', '0.0.10'
```

```
$bundle install
```

2) app/controllers/listings_controller.rb
```
def index
  @listings = Listing.page(params[:page]).order('created_at DESC').per_page(10)
end
 ```

3) app/views/listings/index.html.erb:

```
<% @listings.each do |x| %>

...
...
...
<% end %>

<%= will_paginate %>
```

