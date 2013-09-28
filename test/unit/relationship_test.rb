# == Schema Information
#
# Table name: relationships
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  project_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  amount     :integer
#

require 'test_helper'

class RelationshipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
