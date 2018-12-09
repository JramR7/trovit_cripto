# == Schema Information
#
# Table name: distributor_has_business_managers
#
#  id                  :integer          not null, primary key
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  distributor_id      :integer
#  business_manager_id :integer
#

class DistributorHasBusinessManager < ApplicationRecord

    belongs_to :distributor, foreign_key: true, optional: true
    belongs_to :bussiness_manager, foreign_key: true, optional: true

end
