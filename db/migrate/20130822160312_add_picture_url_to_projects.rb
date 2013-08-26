class AddPictureUrlToProjects < ActiveRecord::Migration
  def change
  	  	add_column :projects, :picture_url, :string
  end
end
