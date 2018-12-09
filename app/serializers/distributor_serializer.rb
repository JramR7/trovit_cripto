# == Schema Information
#
# Table name: distributors
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class DistributorSerializer < ActiveModel::Serializer
  attributes :id, :user_id 
end
