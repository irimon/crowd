# == Schema Information
#
# Table name: projects
#
#  id                    :integer          not null, primary key
#  name                  :string(255)
#  amount                :string(255)
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  phase                 :string(255)
#  end_date              :datetime
#  picture_url           :string(255)
#  description           :string(255)
#  funding_received      :integer
#  percent_funded        :float
#  fully_funded          :bool
#  picture               :file
#  image_file            :image
#  direct_contact_amount :integer
#  project_kind          :string(255)
#  latitude              :float
#  longitude             :float
#

class Project < ActiveRecord::Base
  attr_accessible :amount, :name, :description, :phase, :project_kind, :end_date, :picture_url, :funding_received,  :latitude, :longitude, :fully_funded, :percent_funded
  belongs_to :company
  
  acts_as_gmappable :process_geocoding => false
  
  def gmaps4rails_address
	"bla"
  end

   def gmaps4rails_title
		name
   end
  
  
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
