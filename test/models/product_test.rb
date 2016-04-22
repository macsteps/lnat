require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  def setup
    @product = products(:sencha)
  end

  test "should be valid" do
    assert @product.valid?
  end

  test "name should be present" do
    @product.name = ""
    assert_not @product.valid?
  end

  test "quantity must not be negative" do
    @product.quantity = -1
    assert_not @product.valid?
  end

  test "price must not be negative" do
    @product.price = -1.99
    assert_not @product.valid?
  end

end
