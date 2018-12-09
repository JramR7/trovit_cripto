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

class Product < ApplicationRecord

    validates :price, numericality: { greater_than_or_equal_to: 0 }
    validates :producType, :brand, :productName, 
                presence: true, length: { minimum: 2 }, 
                    format: { with: /\A[^`!@#\$%\^&*+_=]+\z/, 
                        message: "only allows letters and numbers" }
    validates :description, presence: true,length: { minimum: 10 }
    validates :quantity, presence: true, numericality:{ only_integer: true }

    belongs_to :distributor, optional: true
    has_many :pictures, as: :imageable, dependent: :destroy
    has_many :orders, dependent: :destroy
    has_many :offers, dependent: :destroy

    def self.cheaper_than(price)
        where("price < ?", price)
    end

    def self.greater_than(price)
        where("price > ?", price)
    end

    def self.equal(price)
        where("price = ?", price)
    end

    def self.findOffers(product_id)
        joins(:offers).where(id: product_id)
    end

    def self.findOrder(product_id)
        joins(:offers).where(id: product_id)
    end

    def self.findPictures(product_id)
        joins(:pictures).where(id: product_id)
    end

    def self.countProducts
        group("distributor_id").count("distributor_id")
    end

    def self.findHighest(distributor_id)
        price = where(distributor_id: distributor_id).maximum("price")
        where(distributor_id: distributor_id , price: price)
    end

    def self.findLowest(distributor_id)
        price = where(distributor_id: distributor_id).minimum("price")
        where(distributor_id: distributor_id , price: price)
    end

    def self.averages
        group("distributor_id").average("price")
    end

    def self.countOrders
        Order.group("business_manager_id").count("business_manager_id")
    end

    def self.countOffers
        Offer.group("distributor_id").count("distributor_id")
    end

end
