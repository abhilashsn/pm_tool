class Client < ActiveRecord::Base
	
	def list_projects
		Project.where('client_id=?',id)
	end
	def list_project_name
		Project.where('client_id=?',id).pluck(:name)
end
end
