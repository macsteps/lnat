require 'test_helper'

class OrderItemTest < ActiveSupport::TestCase

  def setup
    @order = orders(:one)
    @order_item = order_items(:one)
  end

  test "quantity must not be negative" do
    @order_item.quantity = -1
    assert_not @order_item.valid?
  end

  test "price must not be negative" do
    @order_item.price = -1
    assert_not @order_item.valid?
  end

end
