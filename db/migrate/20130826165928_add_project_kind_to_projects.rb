class AddProjectKindToProjects < ActiveRecord::Migration
  def change
  	add_column :projects, :project_kind, :string
  end
end
