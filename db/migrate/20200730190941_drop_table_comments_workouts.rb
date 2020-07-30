class DropTableCommentsWorkouts < ActiveRecord::Migration[6.0]
  def change
    drop_table :comments_workouts
  end
end
