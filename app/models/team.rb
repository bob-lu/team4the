class Team < ActiveRecord::Base
  attr_accessible :name
  has_many :users

  def average_distance
    total_distance.to_f / users.count
  end

  def average_workouts
    workouts.to_f / users.count
  end

  def average_achievement_points
    achievement_points.to_f / users.count
  end

  def total_distance
    distance = 0.0
    users.each do |user|
      distance += user.total_distance
    end
    distance
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
