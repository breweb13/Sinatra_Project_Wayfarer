class Post < ActiveRecord::Base
    
    belongs_to :user #foreignkey

    validates :location, :journal, :image_url, presence: true

end