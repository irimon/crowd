# == Schema Information
#
# Table name: projects
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  amount           :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  phase            :string(255)
#  end_date         :datetime
#  picture_url      :string(255)
#  description      :string(255)
#  funding_received :integer
#  percent_funded   :float
#  fully_funded     :bool
#  picture          :file
#

require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
