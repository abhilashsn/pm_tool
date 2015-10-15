class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
    	t.string :name
    	t.text :description
    	t.string :status
    	t.date :start_date

    	#t.datetime :created_at
    	#t.datetime :updated_at

      t.timestamps null: false
    end
  end
end
