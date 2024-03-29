# == Schema Information
#
# Table name: projects
#
#  id                    :integer          not null, primary key
#  name                  :string(255)
#  amount                :integer
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
#  yearly_kwh            :integer
#  company_id            :integer
#

class Project < ActiveRecord::Base
  attr_accessible :amount, :name, :description, :phase, :project_kind, :end_date, :picture_url, :funding_received,  :latitude, :longitude, :interese, 
				  :fully_funded, :percent_funded, :payment_number, :first_payment, :yearly_kwh, :company_id
  belongs_to :company
   before_save :default_values
  
  has_many :relationships, dependent: :destroy
  has_many :users, through: :relationships
  
  has_many :news_items, dependent: :destroy
  
  validates :amount, :name, :description, :project_kind, :end_date,  :latitude, :longitude, :interese, :payment_number, presence: true
  validates :amount, :funding_received, :latitude, :longitude, :interese, :percent_funded, :payment_number, numericality: true
  
  
  def default_values
	if (self.funding_received == nil)
		self.picture_url  = "cat1.jpg"
		self.fully_funded = false
		self.percent_funded = 0
		self.funding_received = 0
	end
  end
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
