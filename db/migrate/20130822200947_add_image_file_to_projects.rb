class AddImageFileToProjects < ActiveRecord::Migration
  def change
	  add_column :projects, :image_file, :image
  end
end
