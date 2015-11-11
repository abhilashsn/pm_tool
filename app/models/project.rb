class Project < ActiveRecord::Base
	#id,name,status,description,start_date,created_at,updated_at
	#readers/writers
	has_many :tasks
	has_many :project_categories
	has_many :categories, through: :project_categories
	belongs_to :client
	belongs_to :user
	#validates_presence_of :name, :status, :start_date, :client_id
	#validates_presence_of :start_date, message: "start date should be present"

	#validates_numericality_of :client_id
	#validates_uniqueness_of :name, scope: :client_id

	#validate :check_start_date
	#before_after :generate_code

	def details
		"#{name}---#{status}-----#{start_date}----#{description}---- #{Client.find(client_id).name}---#{Client.find(client_id).email}"
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

	private

	def check_start_date
		if !self.start_date.nil? && self.start_date < Date.today
			errors.add(:start_date,"Date is invalid. shouldnt be less than #{Date.today}")
	end
	end



	def self.find_client
		if self.client_id.n
			Project.all
		end
	end



	#def generate_code
	#	self.code = "#{Random.rand(1000)}"
#end
end
