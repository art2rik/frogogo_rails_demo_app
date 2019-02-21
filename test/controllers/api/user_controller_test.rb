require 'test_helper'

class Api::UserControllerTest < ActionDispatch::IntegrationTest
  test "should get register" do
    get api_user_register_url
    assert_response :success
  end

  test "should get index" do
    get api_user_index_url
    assert_response :success
  end

  test "should get update" do
    get api_user_update_url
    assert_response :success
  end

  test "should get view" do
    get api_user_view_url
    assert_response :success
  end

end
