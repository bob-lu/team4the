class CreateAchievements < ActiveRecord::Migration
  def change
    create_table :achievements do |t|
      t.string :name, :required => true, :null => false
      t.integer :point, :default => 0
      t.boolean :is_single_point, :default => true

      t.timestamps
    end
  end
end
