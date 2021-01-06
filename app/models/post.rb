class Post < ActiveRecord::Base
    
    belongs_to :user

    validates :location, :image_url, :journal ,presence: true #make sure user enters everything correctly
end