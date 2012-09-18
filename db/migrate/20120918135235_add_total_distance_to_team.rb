class AddTotalDistanceToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :total_distance, :float, :default => 0.0
  end
end
