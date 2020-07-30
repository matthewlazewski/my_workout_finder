class Category < ActiveRecord::Base 
    has_many :workouts
    has_many :users, through: :workouts 
    accepts_nested_attributes_for :workouts 

    validates :name, presence: true 
end