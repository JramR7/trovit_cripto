# == Schema Information
#
# Table name: orders
#
#  id                  :integer          not null, primary key
#  quantity            :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  product_id          :integer
#  message_id          :integer
#  business_manager_id :integer
#

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
