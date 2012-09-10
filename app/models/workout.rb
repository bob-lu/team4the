class Workout < ActiveRecord::Base
  attr_accessible :description, :workout_date
  belongs_to :user
end