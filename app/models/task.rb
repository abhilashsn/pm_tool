class Task < ActiveRecord::Base
	belongs_to :project
	validates_presence_of :name, :due_date
	validates_numericality_of :project_id
	#validate :check_due_date



	#private 
	#def check_due_date
	#	if !self.due_date.nil? && due_date < project.start_date
	#		errors.add(:due_date,"Invalid, should not be less than #{project.start_date}")
	#	end	


	#end
	
end
