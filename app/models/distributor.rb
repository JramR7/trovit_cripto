# == Schema Information
#
# Table name: distributors
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Distributor < ApplicationRecord

    belongs_to :user, foreign_key: true, optional: true
    has_many :distributor_has_bussiness_managers, dependent: :destroy
    has_many :bussiness_managers, through: :distributor_has_bussiness_managers
    has_many :products, dependent: :destroy
    has_many :messages, dependent: :destroy
    has_many :offers, dependent: :destroy

    def self.findMessages(distributor_id)
        joins(:messages).where(id: distributor_id).select("messages.message,messages.id,distributors.id")
    end

    def self.findOffers(distributor_id)
        joins(:offer).where(id: distributor_id)
    end

    def self.findProducts(distributor_id)
        joins(:distributor_has_products).where(id: distributor_id)
    end

    def findOffers(distributor_id)
        joins(:offers).where(id: distributor_id)
    end

    def self.userInfo(user_id)
        User.find(user_id)
    end
 

end
