require 'pry'

class WorkoutsController < ApplicationController 
    before_action :find_workout, only: [:edit, :update, :show, :destroy]
    before_action :logged_in?
    
    def index 
        if params[:category_id] && @category = Category.find_by_id(params[:category_id])
            @workout = @category.workouts.ordered_by_duration 
        else 
            @workouts = Workout.all.ordered_by_duration
        end
    end

    def new
        if params[:category_id] && @category = Category.find_by_id(params[:category_id])
            @workout = @category.workouts.build
        else
            @workout = Workout.new  
            @workout.build_category
        end
    end

    def create
        @workout = current_user.workouts.build(workout_params)
        if @workout.valid?
            @workout.save
            redirect_to workout_path(@workout)
        else  
            @category = Category.find_by_id(params[:category_id]) if params[:category_id]
            render :new 
        end
    end

    def edit 
        @workout = Workout.find_by(id: params[:id])
    end

    def update 
        @workout = Workout.find_by(id: params[:id])
        if @workout.user == current_user
            @workout.update(workout_params)
            redirect_to workout_path(@workout)
        else 
            render :edit 
        end
    end

    def destroy
        @workout.delete
        redirect_to workouts_path
    end

    def show
        @workout = Workout.find_by(id: params[:id])
        @comment = Comment.new
        @comment.workout_id = @workout.id 
    end

    private
    def workout_params
        params.require(:workout).permit(:name, :intensity, :duration, :category_id, category_attributes: [:name])
    end

    def find_workout
        @workout = Workout.find(params[:id])
    end

end