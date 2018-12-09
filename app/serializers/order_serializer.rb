# == Schema Information
#
# Table name: orders
#
#  id                  :integer          not null, primary key
#  quantity            :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  product_id          :integer
#  message_id          :integer
#  business_manager_id :integer
#

class OrderSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :created_at, :updated_at, :message_id,
  :product_id, :business_manager_id
end
