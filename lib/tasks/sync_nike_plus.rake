#bundle exec rake sync_nike_plus RAILS_ENV=development --trace

task :sync_nike_plus  => :environment do
  # Syncing with Nike+ system
  puts "Running sync of data from Nike+ at " + Time.now.to_s
  
  teams = Team.all
  competition_start_time = Time.parse("2012-09-12T15:00:00+02:00").utc

  teams.each do |team|
  	# Loop through each user in the team
  	team.users.each do |user|
      total_distance = 0.0
  		# Don't even try if user haven't set nike id and pass.
  		unless user.nike_id.blank? and user.nike_password.blank?
  			begin
	  			activities = user.nike.activities
          next if activities.nil? or activities.any?.eql?(false)

	  			activities.each do |activity|
            if activity.start_time_utc.utc > competition_start_time && activity.metrics.distance > 0.9
              total_distance += activity.metrics.distance 
            end
	  			end
          user.total_distance = total_distance
          user.save
	  		rescue Exception => ex
	  			# We rescue runtime error, which is bad of course but that is what 
	  			# we are gonna get if we are unable to connect to Nike+ with Nike Id and Password
          puts "ERROR IN SYNC for #{user.username}: #{ex.message}"
	  			# TODO: Add some logging.
	  		end
  		end
  	end
  end

  puts "Completed Nike+ sync at " + Time.now.to_s
end