class SessionController < ApplicationController
	# GET /session
	def new
		if is_signed_in?
			redirect_to root_path
		else
			respond_to do |format|
				format.html
			end
		end
	end

	# POST /session
	def create
		user = User.find_by_username(params[:session][:username])
		if user then
			if user.authenticate(params[:session][:password]) then
				sign_in user
				redirect_to session[:return_to] || root_path
			else
				flash[:error] = "Invalid username/password combination."
				redirect_to root_path
			end  
		else
			flash[:error] = "Account not found."
			redirect_to root_path
		end
	end

	# DELETE /session
	def destroy
		sign_out
		redirect_to root_path
	end
end