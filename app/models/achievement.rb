#!/bin/env ruby
# encoding: utf-8

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
    user_val = value

    case uid
      when "springa"
        max_run = 90
        value = value.to_i
        run_diff = max_run - value
        run_point = run_diff * 0.5

        create_or_update_point user, run_point, user_val

      when "simma"
        # 1pt per 30 sec under 15 minutes
        max_swim = 900
        split_arr = value.split('.')
        minutes = split_arr[0].to_i
        seconds = split_arr[1].to_i

        time = (minutes*60) + seconds
        swim_diff = max_swim - time
        swim_point = swim_diff / 30

        create_or_update_point user, swim_point, user_val
        
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

        create_or_update_point user, cindy_point, user_val

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

        create_or_update_point user, a_cindy_point, user_val

      when "pasde", "heal"
        the_point = 1
        value = value.to_i

        the_point += 2 if value.eql?(1)
        the_point += 1 if value.eql?(5)

        create_or_update_point user, the_point, user_val
      when "jonglering"
        value = value.to_i

        juggle_point = 2 if value >= 25
        juggle_point = 3 if value >= 50

        create_or_update_point user, juggle_point, user_val
      
      when "hare", "koppla"
        # Hare / Value = 1 (one leg), 2 (two legs)
        # Koppla / Value = 1 (one way), 2 (two way)
        value = value.to_i
        
        hare_point = 1 if value.eql?(1)
        hare_point = 3 if value.eql?(2)

        create_or_update_point user, hare_point, user_val
      when "tryout"
        tryout_point = AchievementPoint.where(user_id: user.id, achievement_id: id).pluck(:point).first
        tryout_point = 0 if tryout_point.nil?
        tryout_point += 1
        tryout_point = 20 if tryout_point > 20

        create_or_update_point user, tryout_point, user_val
      when "hopprep"
        value = value.to_i

        hopp_point = 2 if value >= 15
        hopp_point += 2 if value >= 25

        create_or_update_point user, hopp_point, user_val
      when "chins"
        # Number of chins
        value = value.to_i
        chin_point = 1 if value > 0
        sets = (value - 1) / 5
        chin_point += (sets * 2) if sets > 0

        create_or_update_point user, chin_point, user_val
      when "rings"
        value = value.to_i
        ring_point = value / 5
        create_or_update_point user, ring_point, user_val
      when "dans"
        # 0 = 1pt, 1-4 is number of "åttor" in a row.
        value = value.to_i
        value = 4 if value > 4
        dance_point = 1 + (2 * value)
        create_or_update_point user, dance_point, user_val
      when "plankan", "luftstol"
        # No points logged, only participation since placement is all that matters.
        create_or_update_point user, 0
    end
  end

  def create_or_update_point(user, points, user_val = "")
    if points.nil?
      raise ArgumentError.new("Ogiltigt värde för achievement.")
    end

    if point_exist? user
      achievement_point = AchievementPoint.where(user_id: user.id, achievement_id: id).first
      achievement_point.point = points
      achievement_point.user_value = user_val
      achievement_point.save
    else
      AchievementPoint.create(user_id: user.id, achievement_id: id, point: points, user_value: user_val)
    end
  end

  def point_exist?(user)
    AchievementPoint.where(user_id: user.id, achievement_id: id).count > 0
  end
end
