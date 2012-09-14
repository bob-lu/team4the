class AchievementPoint < ActiveRecord::Base
  attr_accessible :point, :user, :achievement, :placement, :user_id, :achievement_id, :description, :user_value
  belongs_to :user
  belongs_to :achievement
  
  def self.find_by_user(user)
    self.where(:user_id => user)
  end
end