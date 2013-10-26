class ChangeAmountFormatInProjects < ActiveRecord::Migration
  def self.up
   #change_column :projects, :amount, 'integer USING CAST(amount AS integer)'
  end

  def self.down
   # change_column :projects, :amount, :string
  end
end
