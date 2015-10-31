module HappyHelper
	def client_project

		@clients = Client.all
		@clients.each do |client|   #looping on all projects
     	client.projects.each do |client|  #looping on clients for a project
        client.name 
     end
 end
end
     def client_project1
     	Client.all.each do |client| 
				client.name
				client.projects.each do |project|
  				project.name 
  		end
		end
   	 end 
   	
    
end
