class AddAmountToRelationships < ActiveRecord::Migration
  def change
    add_column :relationships, :amount, :integer
  end
end
