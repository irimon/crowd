# == Schema Information
#
# Table name: seekers
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class SeekerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
