class AddProjectIdToNewsItems < ActiveRecord::Migration
  def change
	add_column :news_items, :project_id, :integer
  end
end
