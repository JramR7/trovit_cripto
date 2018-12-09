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

class Order < ApplicationRecord

    validates :quantity, numericality: { only_integer: true }

    belongs_to :message , optional: true 
    belongs_to :business_manager, optional: true
    belongs_to :product,  optional: true

    def self.cheaper_than(quantity)
        where("quantity < ?", quantity)
    end

    def self.greater_than(quantity)
        where("quantity > ?", quantity)
    end

    def self.equal(quantity)
        where("quantity = ?", quantity)
    end

    def self.countOrders(business_manager_id)
       #where(business_manager_id: business_manager_id)
       where(business_manager_id: business_manager_id).count("business_manager_id")
    end


end
