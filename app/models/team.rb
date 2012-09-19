class Team < ActiveRecord::Base
  attr_accessible :name, :total_distance
  has_many :users

  def average_distance
    total_distance / users.count
  end

  def average_workouts
    workouts.to_f / users.count
  end

  def average_achievement_points
    achievement_points.to_f / users.count
  end

  def workouts
  	total_workouts = 0
  	users.each do |user|
  		total_workouts += user.workouts.count
  	end
  	total_workouts
  end

  def achievement_points
  	total_points = 0.0
  	users.each do |user|
  		total_points += user.achievement_points.sum("point")
  	end
  	total_points
  end
end
