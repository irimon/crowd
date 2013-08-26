class AddPhaseToProjects < ActiveRecord::Migration
  def change
	add_column :projects, :phase, :string
  end
end
