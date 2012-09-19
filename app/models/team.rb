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
  		total_points += user.total_achievement_points
  	end
  	total_points
  end

  def total_ranking
    teams = Team.all.to_a
    distance_ranking = (teams.sort_by{|team| [team.average_distance, team.name] }.reverse.index self) + 1
    workout_ranking = (teams.sort_by{|team| [team.average_workouts, team.name] }.reverse.index self) + 1
    achievement_ranking = ((teams.sort_by{|team| [team.average_achievement_points, team.name] }.reverse.index self) + 1) * 2

    distance_ranking + workout_ranking + achievement_ranking
  end
end