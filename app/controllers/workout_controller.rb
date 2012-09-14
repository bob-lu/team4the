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
	
	def show
		@workout = Workout.find(params[:id])
		
		respond_to do |format|
			format.html
		end	
	end
	
	def destroy
		@workout = Workout.find(params[:id])
		@workout.destroy
		respond_to do |format|
			format.html { redirect_to dashboard_path }
		end
	end
end
