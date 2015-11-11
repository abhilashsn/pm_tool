desc "Setup users and roles"
task :setup_users => :environment do 
	Role.create(name: "admin")
	Role.create(name: "sales")
	Role.create(name: "user")

	user = User.new
	user.email = "admin@gmail.com"
	user.password = "secret123"
	user.save
	user.roles << Role.first

	user = User.new 
	user.email  = "sales@gmail.com"
	user.password = "secret123"
	user.save
	user.roles << Role.second

	users = User.where('email != ? AND email != ?' , "admin@gmail.com", "sales@gmail.com")
	for user in users
		user.roles << Role.third
	end
end
