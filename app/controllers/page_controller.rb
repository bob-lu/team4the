class PageController < ApplicationController
	
	def index
		redirect_to :action => "dashboard" and return if is_signed_in?
	end

	def dashboard
		redirect_to :action => "index" and return unless is_signed_in?
		
		# Current users own workouts
		@workouts = Workout.where(:user_id => current_user.id).order(:workout_date).reverse_order
		
		# Team workouts
		@team_workouts = Array.new
		current_user.team.users.each do |user|
			next if current_user == user
			Workout.where(:user_id => user.id).order(:workout_date).reverse_order.each do |workout|
				@team_workouts.push workout
			end
		end
		
		# Current users own achievements
		@achievements = Array.new
		points = AchievementPoint.where(:user_id => current_user.id)
		points.each do |point|
			@achievements.push({ point: point.point, ach: Achievement.find(point.achievement_id), user: current_user, aid: point.id })
		end
		
		# Team achievements
		@team_achievements = Array.new
		current_user.team.users.each do |user|
			next if current_user == user
			AchievementPoint.where(:user_id => user.id).each do |point|
				@team_achievements.push({ point: point.point, ach: Achievement.find(point.achievement_id), user: user })
			end
		end
	end
end