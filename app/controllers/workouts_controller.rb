class WorkoutController < ApplicationController 
    def index 
        if params[:category_id] && @category = Category.find_by_id(params[:category_id])
            @workout = @category.workouts 
        else 
            @workouts = Workout.all 
        end
    end

    def new
        if params[:category_id] && @category = Category.find_by_id(params[:category_id])
            @workout = @cateogry.workouts.build
        else
            @workout = Workout.new      
        end
    end

    def create
        @workout = current_user.workouts.build(workout_params)
        if @workout.valid?
            redirect_to workout_path(@workout)
        else  
            @category = Category.find_by_id(params[:category_id]) if params[:category_id]
            render :new 
        end
    end

    def edit 

    end

    def update 
        if @workout.user == current_user
            @workout.update(workout_params)
            redirect_to workout_path(@workout)
        else 
            render :edit 
        end
    end

    def destroy
        @workout.destroy
        redirect_to workouts_path
    end

    private
    def workout_params
        parmas.require(:workout).permit(:name, :intensity, :duration)
    end

end