class AddDirectContactAmountToProjects < ActiveRecord::Migration
  def change
    	add_column :projects, :direct_contact_amount, :integer
  end
end
