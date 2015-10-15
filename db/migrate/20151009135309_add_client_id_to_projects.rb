class AddClientIdToProjects < ActiveRecord::Migration
  def change
  	#aadd_column :table_name, :column_name, :column_type
  	#remove_column :table_name, :column_name
  	add_column :projects, :client_id, :integer
  end
end
