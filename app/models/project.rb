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

class Project < ActiveRecord::Base
  attr_accessible :amount, :name, :phase, :end_date, :picture_url, :description, :funding_received, :image_file
  belongs_to :company
  
  def picture_url?
	!picture_url.nil?
  end
  
  def update_funding(new_fund)
	funding_received = funding_received + new_fund
	percent_funded = funding_received/amount
	if percent_funded > 1
		fully_funded = true
	end
  end
  
end
