class AddPlacementToAchievementPoint < ActiveRecord::Migration
  def change
    add_column :achievement_points, :placement, :integer, :null => true
  end
end
