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

require 'test_helper'

class BusinessManagerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
