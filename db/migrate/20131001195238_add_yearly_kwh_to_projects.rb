class AddYearlyKwhToProjects < ActiveRecord::Migration
  def change
    	add_column :projects, :yearly_kwh, :integer
  end
end
