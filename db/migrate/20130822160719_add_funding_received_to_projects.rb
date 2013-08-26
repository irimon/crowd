class AddFundingReceivedToProjects < ActiveRecord::Migration
  def change
  	add_column :projects, :funding_received, :integer
  end
end
