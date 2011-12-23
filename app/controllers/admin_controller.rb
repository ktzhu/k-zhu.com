class AdminController < ApplicationController
	def index
		@projects = Project.all
		@total_projects = Project.count
	end
end
