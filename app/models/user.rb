class User < ActiveRecord::Base 
    has_secure_password

    has_many :workouts
    has_many :categories, through: :workouts
    has_many :comments
    has_many :commented_workouts, through: :comments
end