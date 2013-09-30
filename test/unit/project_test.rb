# == Schema Information
#
# Table name: projects
#
#  id                    :integer          not null, primary key
#  name                  :string(255)
#  amount                :string(255)
#  phase                 :string(255)
#  end_date              :datetime
#  picture_url           :text
#  description           :text
#  funding_received      :integer
#  percent_funded        :float
#  fully_funded          :boolean
#  direct_contact_amount :integer
#  project_kind          :string(255)
#  latitude              :float
#  longitude             :float
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  gmaps                 :boolean
#  interese              :float
#  payment_number        :integer
#  first_payment         :datetime
#

require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
