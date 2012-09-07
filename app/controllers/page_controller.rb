class PageController < ApplicationController
	
	def index
		redirect_to :action => "dashboard" and return if is_signed_in?
	end

	def dashboard
		redirect_to :action => "index" and return unless is_signed_in?
		@workouts = Workout.where(:user_id => current_user.id).order(:workout_date).reverse_order
	end

end