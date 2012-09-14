class Achievement < ActiveRecord::Base
  attr_accessible :is_single_point, :name, :point, :uid
  has_many :achievement_points

  # Collect each achievements for team. Will get the higest point for for each achievements for each user.
  #
  # @param [Object] team
  # @return [Array]
  def self.team_points(team)
    team_achievements = Array.new
    Achievement.all.each do |ach|
      team.users.each do |user|
        points = ach.points(user).collect{|ap| ap.point }
        team_achievements.push({ user: user.username, name: ach.name.downcase.underscore, points: points.max })
      end
    end
    team_achievements
  end
  
  # Collect all points for a single user
  #
  # @param [Object] user
  # @return [Array]
  def points(user)
    self.achievement_points.find_by_user(user)
  end
end
