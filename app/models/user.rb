class User < ActiveRecord::Base
  require 'nike'
  has_secure_password
  validates_presence_of :password, :on => :create
  attr_accessible :username, :password_confirmation, :password, :nike_id, :nike_password, :total_distance
  has_many :workouts
  has_many :achievement_points
  belongs_to :team
  
  def nike
    nike_connection
    @c
  end

  def total_achievement_points
    achievement_points.sum("point")
  end
  
  private
  
  def nike_connection
    @c = ::Nike::Client.new(self.nike_id, self.nike_password) if @c.nil?
  end
end