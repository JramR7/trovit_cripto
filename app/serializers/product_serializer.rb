# == Schema Information
#
# Table name: products
#
#  id             :integer          not null, primary key
#  price          :float
#  producType     :string
#  brand          :string
#  productName    :string
#  quantity       :integer
#  description    :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  distributor_id :integer
#

class ProductSerializer < ActiveModel::Serializer
  attributes :id, :price, :producType, :brand, :productName, :description, :quantity
end
