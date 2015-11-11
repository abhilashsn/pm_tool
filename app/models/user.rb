class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :clients
  has_many :projects
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    #after_save :setup_user_role

	has_one :profile
	has_many :permissions
	has_many :roles, through: :permissions
	has_many :categories






	def role?(role)
		self.roles.pluck(:name).include?(role)     
	end


	def setup_user_role
		if user.roles.empty?
			user.role << Role.third
		end
	end



end
