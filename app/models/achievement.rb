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
        # TODO: Make calculation with float.
        # 1pt per 30 sec under 15 minutes
      when "cindy"
        cindy_point = 5
        value = value.to_i

        if value < 10
          cindy_point += 15
        elsif value < 15
          cindy_point += 12
        elsif value < 20
          cindy_point += 9
        elsif value < 25
          cindy_point += 6
        elsif value < 30
          cindy_point += 3
        end

        create_or_update_point user, cindy_point

      when "a_cindy"
        a_cindy_point = 3
        value = value.to_i

        if value < 10
          a_cindy_point += 8
        elsif value < 15
          a_cindy_point += 6
        elsif value < 20
          a_cindy_point += 4
        elsif value < 25
          a_cindy_point += 2
        elsif value < 30
          a_cindy_point += 1
        end

        create_or_update_point user, a_cindy_point

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
