module SessionHelper
	attr_accessor :current_user

	def is_signed_in?
		session["user"] && User.find(session["user"])
	end

	def sign_out
		reset_session
	end

	def sign_in user
		session["user"] = user.id
		@current_user = user
	end

	def authenticate
		deny_access unless is_signed_in?
	end

	def current_user
		@current_user ||= User.find(session["user"]) if session["user"]
	end

	def deny_access
		flash[:error] = "You are not allowed to access that page"
		redirect_to root_path
	end
end