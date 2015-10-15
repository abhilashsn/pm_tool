10.times do 
	client = Client.new
	client.name = Faker::Name.name
	client.company = Faker::Company.name
	client.website = Faker::Internet.domain_name
	client.email = "#{client.name}@#{client.website}"
	client.save
end

50.times do
	project = Project.new
	project.name = Faker::App.name
	project.status = ["new", "completed", "on-going", "hold"].shuffle.first
	project.description = Faker::Lorem.sentence
	project.start_date = Faker::Date.between(Date.today.beginning_of_year, Date.today.end_of_year)
	project.client_id = Client.order("RANDOM()").first.id
	project.save
end

100.times do
	task = Task.new
	task.name = Faker::Lorem.sentence
	task.project_id = Project.order("RANDOM()").first.id
	task.due_date = Faker::Date.between(Project.find(task.project_id).start_date, Date.today + 2.months)
	task.save
end

for project in Project.all
num = [1,2,3,4].shuffle.first
categories = Category.first(num)
project.categories << categories
end




