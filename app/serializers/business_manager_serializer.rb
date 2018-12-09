# == Schema Information
#
# Table name: business_managers
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  company_id :integer
#

class BusinessManagerSerializer < ActiveModel::Serializer
  attributes :id, :user_id
end
