class SessionsController < ApplicationController
	skip_before_filter :authorize
	
	def new
	end

	def create
		if user = User.authenticate(params[:name], params[:password])
			session[:user_id] = user.id.to_s
			redirect_to admin_url
		else
			redirect_to login_url, :alert => "Ya dun goofed. Check your username/password combination."
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to projects_url, :notice => "You've successfully logged out."
	end
end
