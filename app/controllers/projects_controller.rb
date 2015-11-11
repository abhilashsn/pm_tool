class ProjectsController < ApplicationController
	before_filter :authenticate_user! 
	load_and_authorize_resource
	def index
		# 	Project.where('user_id = ?',current_user.id)
		@projects = (current_user.role? "admin") ? Project.all : current_user.projects
		respond_to do |format|
			format.html
			format.xls
	end
end
	def create 
		@project = Project.new(project_params)
		@project.user_id = current_user.id
		if @project.save
			redirect_to project_path(@project)
		else
			render action: "new"
	end
end

	def set_current_project

		session[:project] = Project.find(params[:project_id]).id
		redirect_to projects_path
	end
	def show 
		begin
		@project = (current_user.role? "admin") ? Project.find(params[:id]) : current_user.projects.find(params[:id])
	rescue ActiveRecordNotFound::RecordNotFound
		redirect_to root_path, notice: "Record Does Not Exist"
	end
	end

	def new 
		@project = Project.new 
	end
private
 def project_params
 	params[:project].permit(:name, :client_id, :description, :start_date, :status)
 end




end
