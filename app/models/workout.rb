class Workout < ActiveRecord::Base
  attr_accessible :description, :workout_date
  belongs_to :user
  
  def user
    User.find(self.user_id)
  end
end