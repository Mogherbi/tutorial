1) install imagemagick
```
for VM:
sudo apt-get install imagemagick libmagickwand-dev
sudo apt-get install imagemagick

for Mac:
brew install imagemagick
```

2) gemfile
```
gem 'carrierwave', github: 'carrierwaveuploader/carrierwave'

gem 'mini_magick'
```
```
$bundle install
```

3) migration add avatar column to table listings
```
$rails g migration add_avatars_to_listings avatars:json

$bundle exec rake db:migrate
```

4)
```$rails generate uploader avatar```

- app/model/listing.rb

```
class Listing < ActiveRecord::Base
  mount_uploaders :avatars, AvatarUploader
end
```

5) app/views/listings/_form.html.erb
```
<%= form.file_field :avatars, multiple: true %>
```

6) app/controllers/listings_controller.rb
```
  def listing_params
    params.require(:listing).permit(:name, :price, :location, {avatars:[]})
  end
```

7) app/uploaders/avatar_uploader.rb
```
  include CarrierWave::MiniMagick
  storage :file

  #make sure minimagick is included

  version :large do
    process resize_to_limit: [800, 800]
  end

  version :medium, :from_version => :large do
    process resize_to_limit: [500, 500]
  end

  version :thumb, :from_version => :medium do
    process resize_to_fit: [100, 100]
  end

  version :square do
    process :resize_to_limit => [300, 300]
  end
  
  def extension_whitelist
    %w(jpg jpeg gif png)
  end

```

8) app/views/listings/show.html.erb

- How to display different version of images

  ```
  <%= image_tag (@listing.avatars[0].large.url) %>
  ```
#Upload to amazon aws 
```reference link: https://dominicbreuker.com/posts/2016/01/17/carrierwave-guide.html```

9) install gem fog
```
gem 'fog'
```
```
$bundle install
```

10)app/uploaders/avatar_uploader.rb
```
storage :fog
#storage :file
```

11) create AWS account
```
- Under AWS account:
 a) create user under AWS account (for eg.: "ABC", generate security credential - :aws_access_key_id & :aws_secret_access_key)
 b) create bucket (for eg. : "my_pairbnb"), bucket country i set to singapore
 c) create policy. On the services/IAM users list, click on your user and go to the tab Permissions. There we can attach the policy we just created to the user "ABC".
 d) On the services/IAM/policy, under policy document tab, I change my resource bucket name to "my_pairbnb" as below:
```

```
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "s3:*",
      "Resource": "arn:aws:s3:::my_pairbnb/*"
    }
  ]
}

```

12) config/initializers/s3.rb
```
CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => ENV['S3_KEY'],#security credentials of my created user "ABC" under my AWS account
      :aws_secret_access_key  => ENV['S3_SECRET_KEY'], #security credentials of my created user "ABC" under my AWS account
      :region                 => 'ap-southeast-1' #my bucket country, i set to singapore, so its ap-southeast-1
  }
  config.fog_directory  = "my_pairbnb" #bucket name, for eg. : "my_pairbnb"
end
```
```
MUST REMEMBER to use gem figaro, store all key and secret key into application.yml and make sure its included in .gitignore
```

13) use FIGARO GEM

```
gem 'figaro'
```
```
$bundle install
```
```
$bundle exec figaro install
```

- config/application.yml
```
S3_KEY: 'XXX'
S3_SECRET_KEY: 'XXX'

```



