require 'test_helper'

class MicropostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get microposts_index_url
    assert_response :success
  end

  test "should get timeline" do
    get microposts_timeline_url
    assert_response :success
  end

  test "should get edit" do
    get microposts_edit_url
    assert_response :success
  end

  test "should get show" do
    get microposts_show_url
    assert_response :success
  end

end
