class WorkoutController < ApplicationController
	def new
		@workout = Workout.new
		respond_to do |format|
			format.html
		end
	end
	
	def create
		@workout = Workout.new(params[:workout])
		@workout.user = current_user
		
		respond_to do |format|
			if @workout.save
				format.html { redirect_to @workout, notice: 'Workout was sucessfully created.' }
			else
				format.html { render action: 'new' }
			end
		end
	end
	
	def show; end
end
