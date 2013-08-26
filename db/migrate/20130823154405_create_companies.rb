class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :company_name
      t.string :description
      t.string :website

      t.timestamps
    end
  end
end
