class CreateWorkouts < ActiveRecord::Migration[6.0]
  def change
    create_table :workouts do |t|
      t.string :name 
      t.integer :user_id
      t.integer :intensity
      t.string :duration
    end
  end
end
