class AddFullyFundedToProjects < ActiveRecord::Migration
  def change
    	add_column :projects, :fully_funded, :bool

  end
end
