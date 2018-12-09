# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  location        :string
#  email           :string           not null
#  phone           :integer
#  userType        :string           default("distributor"), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#

class User < ApplicationRecord

    has_secure_password

    validates :name, :userType, presence: true, length: { minimum: 2 },
                format: { with: /\A[^`!@\$%\^&*+_=]+\z/,
                    message: "only allows letters" }
    validates :location, allow_blank: true, length: { minimum: 2 },
                format: { with: /\A[^`!@#\$%\^&*+_=]+\z/,
                    message: "only allows letters and numbers" }
    validates :phone, allow_blank: true, uniqueness: true, 
                numericality: true, length: {minimum: 7}
    validates :email, presence: true, uniqueness: true,
                format: {with: URI::MailTo::EMAIL_REGEXP} 
    has_many :pictures, as: :imageable, dependent: :destroy


    validates_length_of :password, maximum: 72, minimum: 8, allow_nil: true, allow_blank: false

    before_validation { 
        (self.email = self.email.to_s.downcase)
      }

    validates_presence_of :email
    validates_uniqueness_of :email

    
    def self.selectFive
        limit(5)
    end

    def self.findDistributors
        where(userType: "distributor")
    end

    def self.findBusinessManagers
        where(userType: "businessmanager")
    end

    def self.findPictures(user_id)
        joins(:pictures).where(id: user_id)
    end

    def self.findBusinessManager(user_id)
        BusinessManager.where(user_id: user_id)
    end

    def self.findDistributor(user_id)
        Distributor.where(user_id: user_id)
    end

    def self.countTypes
        group("userType").count("userType")
    end
end
