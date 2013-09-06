class ChangeFullyFundedTypeForProjects < ActiveRecord::Migration
  def up
	# execute  "			CREATE TEMPORARY TABLE projects_backup(name,amount,phase,end_date,picture_url,funding_received,percent_funded,direct_contact_amount,project_kind,latitude,longitude);"
	# execute  "			INSERT INTO projects_backup SELECT name,amount,phase,end_date,picture_url,funding_received,percent_funded,direct_contact_amount,project_kind,latitude,longitude FROM projects;"
	 execute  "			DROP TABLE projects;"
   create_table :projects do |t|
      t.string :name
      t.string :amount
      t.string :phase               
      t.datetime  :end_date             
      t.text :picture_url      
      t.text :description         
      t.integer :funding_received     
	  t.float :percent_funded       
	  t.boolean :fully_funded          
	  t.integer :direct_contact_amount 
	  t.string :project_kind          
	  t.float :latitude             
	  t.float :longitude           
      t.timestamps
    end 
	# execute  "			CREATE TABLE projects(name,amount,phase,end_date,picture_url,funding_received,percent_funded,direct_contact_amount,project_kind,latitude,longitude);"
	# execute  "			INSERT INTO projects SELECT name,amount,phase,end_date,picture_url,funding_received,percent_funded,direct_contact_amount,project_kind,latitude,longitude FROM projects_backup;"
	# execute  "			DROP TABLE projects_backup;"
	# execute  "			COMMIT; "
			
  end

  def down
  end
end
