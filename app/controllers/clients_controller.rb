class ClientsController < ApplicationController
	#index - listing resources 
	#new - setting up object to be used in forms
	#create -insert the form record into database
	#show - to display single resource
	#edit - find the record to be edited
	#update - update info into db coming from form 
	#destroy - used to delete the record from the db
	def index
		@clients = Client.all 
         
	end

	def new
		@clients = Client.new
	end

	def create
		@clients = Client.new(client_params)
			if @clients.save
				redirect_to clients_path
			else
				render action: "new"
			end
	end

	def show 
		begin
		@client = Client.find(params[:id])
		@projects = @client.projects
	rescue ActiveRecord::RecordNotFound
		redirect_to clients_path
	end
end

	def edit 
		@client = Client.find(params[:id])
	end


	def update
		@client = Client.find(params[:id])
		if @client.update_attributes(client_params)
			redirect_to client_path(@client)
		else
			render action: "edit"
		end
	end

	def destroy
		@client = Client.find(params[:id])
		if @client.destroy
			redirect_to clients_path
		end
	end


		private

		def client_params
			params[:client].permit(:name, :company, :email, :website, :mobile)
		end

	end


































