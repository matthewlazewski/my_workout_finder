require 'pry'

class WorkoutsController < ApplicationController 
    #before_action :find_workout 
    
    def index 
        if params[:category_id] && @category = Category.find_by_id(params[:category_id])
            @workout = @category.workouts 
        else 
            @workouts = Workout.all 
        end
    end

    def new
        if params[:category_id] && @category = Category.find_by_id(params[:category_id])
            @workout = @category.workouts.build
        else
            @workout = Workout.new      
        end
    end

    def create
        @workout = current_user.workouts.build(workout_params)
        binding.pry
        if @workout.valid?
            @workout.save
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
        params.require(:workout).permit(:name, :intensity, :duration, :category_id, category_attributes: [:name])
    end

    def find_workout
        @workout = Workout.find(params[:id])
    end

end