require 'test_helper'

class ProductsControllerTest < ActionController::TestCase

  def setup
    @product = products(:sencha)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get show" do
    get :show, id: @product
    assert_response :success
  end

end
