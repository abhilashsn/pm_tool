class ProjectsController < ApplicationController
	def index
		@projects = Project.all
	end
	def create 
		@project = Project.new(project_params)
		if @project.save
			redirect_to project_path(@project)
		else
			render action: "new"
	end
end
	def show 
		@project = Project.find(params[:id])
	end

	def new 
		@project = Project.new 
	end
private
 def project_params
 	params[:project].permit(:name, :client_id, :description, :start_date, :status)
 end




end
