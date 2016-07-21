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

3) migration add avatar column to table listings
```
$rails g migration add_avatars_to_listings avatars:json

$bundle exec rake db:migrate
```

4) app/model/listing.rb
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
```

8) app/views/listings/show.html.erb
- How to display different version of images
  ```
  <%= image_tag (@listing.avatars[0].large.url) %>
  ```
#upload to amazon aws

9) gemfile
```
gem 'fog'
```

10)app/uploaders/avatar_uploader.rb
```
storage :fog
```

11)
config/initializers/s3.rb
```
CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => ENV['S3_KEY'],
      :aws_secret_access_key  => ENV['S3_SECRET_KEY'],
      :region                 => 'ap-southeast-1' # Change this for different AWS region. Default is 'us-east-1'
  }
  config.fog_directory  = "ssy_pairbnb" #name_of_directory
end
```
```
MUST REMEMBER: use gem figaro, store all key and secret key into application.yml and make sure its included in .gitignore
```


