# == Schema Information
#
# Table name: companies
#
#  id           :integer          not null, primary key
#  company_name :string(255)
#  description  :string(255)
#  website      :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Company < ActiveRecord::Base
  attr_accessible :company_name, :description, :website
  
  has_many :projects
end
