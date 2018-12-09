# == Schema Information
#
# Table name: distributor_has_products
#
#  id             :integer          not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  distributor_id :integer
#  product_id     :integer
#

require 'test_helper'

class DistributorHasProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
