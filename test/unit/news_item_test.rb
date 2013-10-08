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

require 'test_helper'

class NewsItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
