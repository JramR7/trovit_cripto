# == Schema Information
#
# Table name: offers
#
#  id             :integer          not null, primary key
#  quantity       :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  message_id     :integer
#  product_id     :integer
#  distributor_id :integer
#

require 'test_helper'

class OfferTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
