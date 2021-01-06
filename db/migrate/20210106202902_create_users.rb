class CreateUsers < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :location
      t.string :image_url
      t.text :journal
      t.integer :user_id #belongs to user 

      t.timestamps null: false
    end



  end
end