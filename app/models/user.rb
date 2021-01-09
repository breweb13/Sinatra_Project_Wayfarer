class User < ActiveRecord::Base
    has_many :posts

    has_secure_password #make sure password is secure with password.digest

    validates :username, uniqueness: true #make sure the same username is not being used
end