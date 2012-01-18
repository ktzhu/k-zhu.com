class ProjectsController < ApplicationController
	before_filter :authorize, :except => [:index, :show]

	def index
		@projects = Project.all
	end
	
	# GET /projects/1
	def show
		@project = Project.find_by_slug!(params[:id])
	end

	def new
		@project = Project.new
	end

	def edit
		@project = Project.find_by_slug!(params[:id])
	end

	# POST /projects
	def create
		@project = Project.new(params[:project])

		if @project.save
			redirect_to(admin_url, :notice => "Successfully added project #{@project.name}.")
		else
			render :action => "new"
		end
	end

	# PUT /projects/1
	def update
		@project = Project.find_by_slug!(params[:id])
		if @project.update_attributes(params[:project])
			redirect_to(@project, :notice => "Project successfully updated.")
		else
			render :action => "edit"
		end
	end

	def destroy
		@project = Project.find_by_slug!(params[:id])
		@project.destroy

		redirect_to(admin_url)
	end
end
