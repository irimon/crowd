class AddFirstPaymentToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :first_payment, :datetime
  end
end
