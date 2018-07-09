require 'test_helper'

class VotersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get voters_index_url
    assert_response :success
  end

  test "should get show" do
    get voters_show_url
    assert_response :success
  end

  test "should get new" do
    get voters_new_url
    assert_response :success
  end

  test "should get edit" do
    get voters_edit_url
    assert_response :success
  end

end
