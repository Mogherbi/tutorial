http://apidock.com/rails/v4.0.2/ActiveModel/SecurePassword/ClassMethods/has_secure_password

1) gemfile

gem 'bcrypt', '~>3.1.7'

$bundle install
#install bcrypt gem


2) app/models/user.rb

class User < ActiveRecord::Base
  has_secure_password

end

3) db/migrate/20160728000000_create_users.rb

def change
  ....
  .....

  t.string :password_digest
  ....
end


4) test using .authentication method
#if return result
```
user = User.new(name: 'david', password: '', password_confirmation: 'nomatch')
user.save                                                       # => false, password required
user.password = 'mUc3m00RsqyRe'
user.save                                                       # => false, confirmation doesn't match
user.password_confirmation = 'mUc3m00RsqyRe'
user.save                                                       # => true
user.authenticate('notright')                                   # => false
user.authenticate('mUc3m00RsqyRe')                              # => user
User.find_by(name: 'david').try(:authenticate, 'notright')      # => false
User.find_by(name: 'david').try(:authenticate, 'mUc3m00RsqyRe') # => user
```
