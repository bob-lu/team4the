class RemoveTotalDistanceFromTeam < ActiveRecord::Migration
  def up
    remove_column :teams, :total_distance
  end

  def down
    add_column :teams, :total_distance, :float
  end
end
