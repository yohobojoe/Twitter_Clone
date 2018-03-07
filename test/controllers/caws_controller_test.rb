require 'test_helper'

class CawsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @caw = caws(:one)
  end

  test "should get index" do
    get caws_url
    assert_response :success
  end

  test "should get new" do
    get new_caw_url
    assert_response :success
  end

  test "should create caw" do
    assert_difference('Caw.count') do
      post caws_url, params: { caw: { message: @caw.message, user_id: @caw.user_id } }
    end

    assert_redirected_to caw_url(Caw.last)
  end

  test "should show caw" do
    get caw_url(@caw)
    assert_response :success
  end

  test "should get edit" do
    get edit_caw_url(@caw)
    assert_response :success
  end

  test "should update caw" do
    patch caw_url(@caw), params: { caw: { message: @caw.message, user_id: @caw.user_id } }
    assert_redirected_to caw_url(@caw)
  end

  test "should destroy caw" do
    assert_difference('Caw.count', -1) do
      delete caw_url(@caw)
    end

    assert_redirected_to caws_url
  end
end
