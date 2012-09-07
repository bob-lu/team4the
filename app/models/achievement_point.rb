class AchievementPoint < ActiveRecord::Base
  attr_accessible :achievement_id, :point, :user_id
end
