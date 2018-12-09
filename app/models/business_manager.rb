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

class BusinessManager < ApplicationRecord

    belongs_to :user, foreign_key: true, optional: true
    belongs_to :company, foreign_key: true, optional: true
    has_many :distributor_has_bussiness_managers , dependent: :destroy
    has_many :distributors, through: :distributor_has_bussiness_managers
    has_many :messages, dependent: :destroy
    has_many :orders, dependent: :destroy


    def self.findMessages(businessManager_id)
        joins(:messages).where(id: businessManager_id).select("messages.message,messages.id")
    end

    def self.findOrders(businessManager_id)
        joins(:orders).where(id: businessManager_id)
    end

    def findOrders(businessManager_id)
        joins(:orders).where(id: businessManager_id)
    end

    def findDistributor(businessManager_id)
        joins(:distributors).where.(id: businessManager_id)
    end



end
