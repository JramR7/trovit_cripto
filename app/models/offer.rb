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

class Offer < ApplicationRecord

    validates :quantity, numericality: { only_integer: true }
    belongs_to :product, optional: true
    belongs_to :distributor, optional: true
    belongs_to :message, optional: true

    def self.bigger_than(quantity)
        where("quantity < ?", quantity)
    end

    def self.greater_than(quantity)
        where("quantity > ?", quantity)
    end

    def self.equal(quantity)
        where("quantity = ?", quantity)
    end

    def self.countOrders(distributor_id)
        #where(distributor_id: distributor_id)
        where(distributor_id: distributor_id).count("distributor_id")
     end

end
