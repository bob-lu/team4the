class AddUidToAchievement < ActiveRecord::Migration
  def change
    add_column :achievements, :uid, :string
  end
end
