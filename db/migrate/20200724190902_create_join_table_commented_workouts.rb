class CreateJoinTableCommentedWorkouts < ActiveRecord::Migration[6.0]
  def change
    create_join_table :comments, :workouts do |t|
      # t.index [:comment_id, :workout_id]
      # t.index [:workout_id, :comment_id]
    end
  end
end
