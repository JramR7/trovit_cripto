# == Schema Information
#
# Table name: messages
#
#  id                  :integer          not null, primary key
#  message             :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  distributor_id      :integer
#  business_manager_id :integer
#

class MessageSerializer < ActiveModel::Serializer
  attributes :id, :message, :created_at, :updated_at,
   :distributor_id, :business_manager_id
end
