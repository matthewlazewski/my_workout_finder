class Workout < ActiveRecord::Base 
    belongs_to :category
    belongs_to :user 
    has_many :comments
    has_many :users, through: :comments, source: :user

    accepts_nested_attributes_for :comments 

    scope :short_workouts, ->(duration) {where('duration < ?', price)}

    def category_attributes=(attr)
        if !attr[:name].blank?
            self.category = Category.find_or_create_by(name: attr[:name])
        end
    end
end