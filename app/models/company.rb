# == Schema Information
#
# Table name: companies
#
#  id          :integer          not null, primary key
#  name        :string
#  location    :string
#  companyType :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Company < ApplicationRecord
    
    validates :name, :location, presence: true, length: { minimum: 2 },
            format: { with: /\A[^`!@\$%\^&*+_=]+\z/,
                message: "only allows letters" }
    
    validates :companyType, presence: true, length: { minimum: 2 }, 
                format: { with: /\A[^0-9]+\z/, 
                    message: "only allows letters" }

    has_many :business_managers

    def self.showEmployees(company_id)
        joins(:business_managers).where(id:company_id).select("business_managers.id, business_managers.company_id")
    end



end
    
