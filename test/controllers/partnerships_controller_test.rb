require 'test_helper'

class PartnershipsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get partnerships_index_url
    assert_response :success
  end

  test "should get show" do
    get partnerships_show_url
    assert_response :success
  end

  test "should get new" do
    get partnerships_new_url
    assert_response :success
  end

  test "should get create" do
    get partnerships_create_url
    assert_response :success
  end

  test "should get edit" do
    get partnerships_edit_url
    assert_response :success
  end

  test "should get update" do
    get partnerships_update_url
    assert_response :success
  end

  test "should get destroy" do
    get partnerships_destroy_url
    assert_response :success
  end

end
