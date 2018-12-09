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

class CompanySerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :companyType
end
