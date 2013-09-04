# == Schema Information
#
# Table name: images
#
#  id           :integer          not null, primary key
#  file_name    :string(255)
#  content_type :string(255)
#  file_size    :integer
#  file_data    :binary
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
