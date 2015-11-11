object @client
attributes :id, :name, :company, :website

if @client.user == current_user
	node(:edit_url) {|client| edit_client_url(client)}
end

child :user do
	attributes :id, :email, :sign_in_count
end

child :projects do 
	attributes :id, :name, :start_date, :description
	node(:show_url) {|project| project_url(project)}
	child :tasks do
	attributes :id, :name, :due_date, :is_completed
	end
end