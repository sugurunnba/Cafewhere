require 'test_helper'

class Admin::NewesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_newes_new_url
    assert_response :success
  end

  test "should get index" do
    get admin_newes_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_newes_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_newes_edit_url
    assert_response :success
  end

end
