require 'test_helper'

class User::NewesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_newes_index_url
    assert_response :success
  end

  test "should get show" do
    get user_newes_show_url
    assert_response :success
  end

end
