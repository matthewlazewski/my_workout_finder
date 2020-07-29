class CommentsController < ApplicationController 
    before_action :logged_in?
    
    def index 
        @workout = Workout.find_by(id: params[:workout_id])
        @comments = Comment.all 
    end

    def new 
        @comment = Comment.new(workout_id: params[:workout_id])
    end

    def create
        @workout = Workout.find(params[:workout_id])
        @comment = @workout.comments.create(comment_params)
        @comment.user_id = current_user.id       
        if @comment.save
            redirect_to workout_path(@workout)
        else 
            redirect_to root_path
        end
    end

    def destroy
        @comment = @workout.comments.find(params[:id])

        if @comment.user_id == current_user.id 
            @comment.destroy 
        else 
            redirect_to workouts_path 
        end
    end

    private
    def comment_params 
        params.require(:comment).permit(:rating, :content, :workout_id, user_attributes: [:username])
    end
end