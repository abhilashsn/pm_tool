class TasksController < ApplicationController
	def index
		@tasks = Task.all
	end

	def create
		#@project = Project.find(params[:project_id])
		@task = Task.new(task_params)
		if @task.save
			redirect_to project_path(@task.project_id)
		else
			render action: "new"
		end
	end

	def new 
	end

	def mark_as_complete
		@task = Task.find(params[:task_id])
		@task.update_attributes(is_completed: true)
		redirect_to :back
	end

	def mark_as_incomplete
		@task = Task.find(params[:task_id])
		@task.update_attributes(is_completed: false)
		redirect_to :back
	end


private
	def task_params
		params[:task].permit(:name,:project_id,:is_completed,:due_date)
	end

end
