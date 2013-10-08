# == Schema Information
#
# Table name: news_items
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :text
#  auther     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  project_id :integer
#

class NewsItem < ActiveRecord::Base
  attr_accessible :auther, :content, :title, :project_id
   belongs_to :project
end
