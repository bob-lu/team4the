class AddTotalDistanceToUser < ActiveRecord::Migration
  def change
    add_column :users, :total_distance, :float, :default => 0.0
  end
end
