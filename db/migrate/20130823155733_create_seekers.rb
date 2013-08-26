class CreateSeekers < ActiveRecord::Migration
  def change
    create_table :seekers do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
