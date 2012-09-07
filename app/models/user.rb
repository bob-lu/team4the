class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :password, :on => :create
  attr_accessible :username, :password_confirmation, :password
  has_many :workouts
  has_many :achievement_points
end
