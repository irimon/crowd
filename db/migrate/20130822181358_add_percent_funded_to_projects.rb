class AddPercentFundedToProjects < ActiveRecord::Migration
  def change
      	add_column :projects, :percent_funded, :float
  end
end
