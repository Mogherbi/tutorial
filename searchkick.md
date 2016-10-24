reference_link: https://github.com/ankane/searchkick


1) Install Elasticsearch. 
If you have Homebrew installed, use:

```
$brew install elasticsearch
```
If you use VM, use:
```
$sudo apt-get install elasticsearch
```

2) Gemfile

```
gem 'searchkick'

$bundle install

```

3) Add searchkick to models you want to search.
In my case, I want to search on `listing model`
```
class Listing < ActiveRecord::Base
  ...

  ...
  ...

  searchkick match: :word_start, searchable: [:name, :location]
end
```

4) Setting the routes in `config/routes.rb`

```
root 'welcome#index'
get '/search', to: 'listings#search'
```



5) I parked the search bar on my root page (for eg. app/views/welcome/index)
```
  <%= form_for Listing.new, method: :get, url: search_path, class: "navbar-form navbar-left" do |f| %>
    <%= text_field_tag :term, params[:term], placeholder:"Where do you wanna go?" %>
    <%= f.submit 'search', class: 'btn btn-primary' %>
  <% end %>
```

6) app/controllers/listings_controller.rb
```
class ListingsController < ApplicationController
  ...
  ...
  ...


  def index
    @listings = Listing.all
  end

  def search
        @listings = Listing.search(params[:term], fields: ["name", "location"], mispellings: {below: 5})
        if @listings.blank?
          redirect_to listings_path, flash:{danger: "no successful search result"}
        else
          render :index
        end
  end
end
```



7) How to run elasticsearch on terminal
```
1. In the terminal, 
- for Mac: run '$ elasticsearch'
- for VM: run '$ sudo service elasticsearch start'

2. In a separate tab in the terminal, 
- run '$ bundle exec rake searchkick:reindex CLASS=Listing'
```
*read more on reference link on top to learn when to reindex and when not to:

https://github.com/ankane/searchkick

```
3. In a separate tab in the terminal, run '$ bundle exec rails s'
```

8) When you deploy
```
4. $ heroku config:set ELASTICSEARCH_URL=`heroku config:get SEARCHBOX_URL`
5. $ heroku run rake searchkick:reindex CLASS=Listing

```
