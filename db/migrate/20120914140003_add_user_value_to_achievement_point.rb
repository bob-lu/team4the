class AddUserValueToAchievementPoint < ActiveRecord::Migration
  def change
    add_column :achievement_points, :user_value, :string
  end
end
