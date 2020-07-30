class Category < ActiveRecord::Base 
    has_many :workouts
    accepts_nested_attributes_for :workouts 

    validates :name, presence: true 
end