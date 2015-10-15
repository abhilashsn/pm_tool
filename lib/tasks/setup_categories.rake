desc "script to setup initail categories"
task :setup_categories => :environment do
	Category.create(name: "Graphic Designer")
	Category.create(name: "Web Developer")
	Category.create(name: "web Design")
	Category.create(name: "Mobile Apps")
	
end