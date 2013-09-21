class AddGmapsToProjects < ActiveRecord::Migration
  def change
	add_column :projects, :gmaps, :boolean
  end
end
