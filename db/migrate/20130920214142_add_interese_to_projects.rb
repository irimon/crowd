class AddIntereseToProjects < ActiveRecord::Migration
  def change
	add_column :projects, :interese, :float
  end
end
