# == Schema Information
#
# Table name: offers
#
#  id             :integer          not null, primary key
#  quantity       :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  message_id     :integer
#  product_id     :integer
#  distributor_id :integer
#

class OfferSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :created_at, :updated_at, :message_id,
    :product_id, :distributor_id
end
