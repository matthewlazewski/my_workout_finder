class WorkoutController < ApplicationController 
    def index 
        @workouts = Workout.all 
    end

    def new
        @workout = Workout.new 
    end

    def create

    end

    def edit 

    end

    def update 

    end

    def delete

    end

    private
    def workout_params
        
    end

end