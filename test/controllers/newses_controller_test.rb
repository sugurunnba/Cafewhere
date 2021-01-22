require 'test_helper'

class NewsesControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get newses_new_url
    assert_response :success
  end

  test 'should get index' do
    get newses_index_url
    assert_response :success
  end

  test 'should get show' do
    get newses_show_url
    assert_response :success
  end

  test 'should get edit' do
    get newses_edit_url
    assert_response :success
  end
end
