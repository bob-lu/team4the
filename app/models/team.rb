class Team < ActiveRecord::Base
  attr_accessible :name
  has_many :users

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

  def total_distance
  	# TODO: Calculation of dizzzztance.
  end
end
