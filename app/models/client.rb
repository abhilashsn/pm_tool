class Client < ActiveRecord::Base
	has_many :projects, dependent: :destroy
	belongs_to :user
	validates_presence_of :name, :company, :email, :website
	validates_numericality_of :mobile
	validates_length_of :mobile, is: 10
	validates_uniqueness_of :email
	validates_length_of :name, within: 2..24
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  
	def list_projects
		Project.where('client_id=?',id)
	end
	def list_project_name
		Project.where('client_id=?',id).pluck(:name)
end
end
