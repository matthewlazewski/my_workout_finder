class Workout < ActiveRecord::Base 
    belongs_to :category
    belongs_to :user 
    has_many :comments
    has_many :users, through: :comments, source: :user

    validates :name, presence: true
    validates :name, uniqueness: true
    validates :duration, presence: true 
    validates :intensity, presence: true 


    accepts_nested_attributes_for :comments 

    scope :ordered_by_duration, -> {order(duration: :asc)}

    def category_attributes=(attr)
        if !attr[:name].blank?
            self.category = Category.find_or_create_by(name: attr[:name])
        end
    end
end