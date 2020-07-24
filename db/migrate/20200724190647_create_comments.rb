class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :rating
      t.text :content 
      t.integer :user_id
      t.integer :workout_id
    end
  end
end
