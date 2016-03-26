require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  def setup
    @user = users(:akira)
    @user.confirm
  end

  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get settings" do
    sign_in @user
    @request.env["devise.mapping"] = Devise.mappings[:user]
    get :settings
    assert_response :success
  end

end
