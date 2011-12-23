class UsersController < ApplicationController
	skip_before_filter :authorize

	def index
		@users = User.order(:name)
	end
	
	def show
		@user = User.find_by_name!(params[:name])
	end

	def new
		@user = User.new
	end
	
	def edit
		@user = User.find_by_name!(params[:name])
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			redirect_to(users_url, :notice => "Boom. User #{@user.name} is now a thing.")
		else
			render :action => "new"
		end
	end

	def update
		@user = User.find_by_name!(params[:name])
		if @user.update_attributes(params[:user])
			redirect_to(users_url, :notice => "Boom. You've updated user #{@user.name}.")
		else
			render :action => "edit"
		end
	end

	def destroy
		@user = User.find_by_name!(params[:name])
		@user.destroy
		
		redirect_to(users_url)
	end
end
