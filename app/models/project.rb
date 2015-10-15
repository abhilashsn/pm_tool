class Project < ActiveRecord::Base
	#id,name,status,description,start_date,created_at,updated_at
	#readers/writers
	has_many :tasks
	has_many :project_categories
	has_many :categories, through: :project_categories
	
	def details
		"#{name}---#{status}-----#{start_date}----#{description}---- #{Client.find(client_id).name}"
	end

	def self.by_range(start_date,end_date)
		Project.where('start_date >= ? AND start_date <= ?', start_date,end_date)     
	end

	def self.complete
    Task.where('is_completed =?', true)
    end

    def self.incomplete
    Task.where('is_completed=?',false)
	end

	def self.overdue
	Task.where('due_date=?',Date.tomorrow)
	end

	def self.incomplete_p
		Project.where('status = ?',"incomplete")
	end

	def self.complete_p
		Project.where('status =?',"completed")
	end

end
