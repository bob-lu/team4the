class Achievement < ActiveRecord::Base
  attr_accessible :is_single_point, :name, :point
  has_many :achievement_points
end
