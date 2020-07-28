class CommentsController < ApplicationController 

    
    def index 
        @workout = Workout.find_by(id: params[:workout_id])
        @comments = Comment.all 
    end

    def new 
        @comment = Comment.new 
    end

    def create
        @comment = Comment.new(comment_params)
        @comment.save
        redirect_to workout_comment_path(@workout)
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
        params.require(:comment).permit(:rating, :content, :workout_id, :user_id, user_attributes: [:username])
    end

    def find_commentable 
        if params[:comment_id]
            @commentable = Comment.find_by_id(params[:comment_id])
        elsif params[:workout_id]  
            @commentable = Workout.find_by_id(params[:workout_id])
        end
    end
end