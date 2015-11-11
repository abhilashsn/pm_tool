class ClientsController < ApplicationController
	before_filter :authenticate_user!
	before_filter :find_record, only: [:show, :edit]
	load_and_authorize_resource

	#index - listing resources 
	#new - setting up object to be used in forms
	#create -insert the form record into database
	#show - to display single resource
	#edit - find the record to be edited
	#update - update info into db coming from form 
	#destroy - used to delete the record from the db
	def index
		@clients = (current_user.role? "sales") ? Client.all : current_user.clients
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
		
	end

	def edit 
		
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

		def find_record
		@client = (current_user.role? "sales") ? Client.find(params[:id]) : current_user.clients.find(params[:id])
		rescue ActiveRecord::RecordNotFound
		redirect_to clients_path, notice: "Record Not Found"
		
		end


		def client_params
			params[:client].permit(:name, :company, :email, :website, :mobile)
		end

	end


































