class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.date :workout_date, :required => false, :null => false
      t.integer :user_id, :required => true, :null => false
      t.string :description, :null => false, :default => ""

      t.timestamps
    end
  end
end
