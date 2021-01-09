class Post < ActiveRecord::Base
    
    belongs_to :user

    validates :location, :journal, :image_url, presence: true
end