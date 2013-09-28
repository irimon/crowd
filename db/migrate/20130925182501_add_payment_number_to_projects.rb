class AddPaymentNumberToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :payment_number, :integer
  end
end
