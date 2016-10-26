

#1) Gemfile
```
source 'https://rubygems.org'

gem 'pg'
gem 'rails', '4.2.3'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

group :development, :test do
  gem "rspec-given"
  gem 'byebug'
  gem 'spring'
  gem 'shoulda-matchers'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'guard-rspec'
  gem 'rb-fsevent'
end

group :development do
  gem 'web-console', '~> 2.0'
end
```

#2)install rspec n guard
```
$ rails generate rspec:install
$ guard init rspec
```


#3) rails_helper.rb

Initialize Capybara and shoulda matcher by adding the following codes into the spec/rails_helper.rb
```
require 'shoulda/matchers'
require 'capybara/rails'
```



```
RSpec.configure do |config|
  ...
  ...
  config.include Capybara::DSL
  config.infer_spec_type_from_file_location!
  config.include FactoryGirl::Syntax::Methods

end
```


```
 Shoulda::Matchers.configure do |config|
    config.integrate do |with|
      with.test_framework :rspec
      with.library :rails
    end
  end
```




