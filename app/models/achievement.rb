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

  def calculate_and_save_point(user, value)
    case uid
      when "springa"
        max_run = 90
        value = value.to_i
        diff = max_run - value
        run_point = diff * 0.5
        create_or_update_point user, run_point
      when "simma"
        
      when "cindy"

      when "a_cindy"
      when "pasde"
      when "heal"
      when "jonglering"
      when "hare"
      when "tryout"
      when "hopprep"
      when "koppla"
      when "chins"
      when "dans"
      when "plankan"
      when "luftstol"
    end
  end

  def create_or_update_point(user, points)
    if point_exist? user
      achievement_point = AchievementPoint.where(user_id: user.id, achievement_id: id).first
      achievement_point.point = points
      achievement_point.save
    else
      AchievementPoint.create(user_id: user.id, achievement_id: id, point: points)
    end
  end

  def point_exist?(user)
    AchievementPoint.where(user_id: user.id, achievement_id: id).count > 0
  end
end
