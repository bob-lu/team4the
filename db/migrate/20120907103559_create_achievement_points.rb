class CreateAchievementPoints < ActiveRecord::Migration
  def change
    create_table :achievement_points do |t|
      t.integer :user_id, :required => true, :null => false
      t.integer :achievement_id, :required => true, :null => false
      t.integer :point, :required => true, :null => false

      t.timestamps
    end
  end
end
