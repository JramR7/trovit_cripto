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

class Message < ApplicationRecord

    validates :message, presence: true,length: { minimum: 10 },
                format: {with: /\A[^`!@#%\^&*+_=]+\z/,
                        message:"only numbers and letters"}

    has_many :offers
    has_many :orders

    def self.findOrders(message_id)
        joins(:orders).where(id: message_id)
    end

    def self.findOffers(message_id)
        joins(:offers).where(id: message_id)
    end


end
