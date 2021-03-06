class User < ActiveRecord::Base 
    has_secure_password

    has_many :workouts
    has_many :categories, through: :workouts
    has_many :comments

    validates :username, :email, presence: true 

    scope :most_workouts, -> {joins(:workouts).group("user_id").order("count(*) DESC")}

    def self.create_from_omniauth(auth)
        User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
            u.username = auth['info']['name']
            u.email = auth['info']['email']
            u.password = SecureRandom.hex(16)
        end
    end
end