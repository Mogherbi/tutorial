1) gemfile
gem 'bootstrap-sass', '~> 3.3.5'
gem 'autoprefixer-rails'
gem 'bootstrap-select-rails'


2) app/views/layout/application.html.erb
```<head>
  <title>XXX</title>

<!-- CSS -->
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

  <%= stylesheet_link_tag 'application', media: 'all', 'data-turbolinks-track' => true %>

  <!-- JS -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
  <script src="https://js.braintreegateway.com/v2/braintree.js"></script>
  <%= javascript_include_tag 'application', 'data-turbolinks-track' => true %>
  <%= csrf_meta_tags %>
  <meta name="viewport" content="width=device-width,initial-scale=1.0">

</head>
```

3) app/assets/stylesheets/application.css
```
@import "bootstrap-sprockets";
@import "bootstrap";
@import "bootstrap-select";

```