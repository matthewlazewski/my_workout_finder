class CommentsController < ApplicationController 
    
    def index 
        @comments = @workout.comments.order(created_at: :desc)
    end

    def create
        @comment = @workout.comments.create(comment_params)
        @comment.user = current_user
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
        params.require(:comment).permit(:rating, :content)
    end
end