class AchievementPoint < ActiveRecord::Base
  attr_accessible :point, :user, :achievement
  belongs_to :user
  belongs_to :achievement
end