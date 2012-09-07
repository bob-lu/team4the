class User < ActiveRecord::Base
  attr_accessible :nike_id, :nike_password, :password_digest, :username

  has_many :workouts
  has_many :achievement_points
end
