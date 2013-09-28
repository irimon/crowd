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

class Relationship < ActiveRecord::Base
  attr_accessible :project_id, :user_id, :amount
  
  belongs_to :user
  belongs_to :project
  
  def build(project_id, user_id, amount)
	update_attribute(:project_id,project_id)
	update_attribute(:user_id,user_id)
	update_attribute(:amount,amount)
	self.save
  end
  
end
