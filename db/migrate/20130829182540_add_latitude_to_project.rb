class AddLatitudeToProject < ActiveRecord::Migration
  def change
	add_column :projects, :latitude,  :float 
  end
end
