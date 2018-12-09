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

class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :phone, :userType, :location 
end
