require 'test_helper'

class EyesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @eye = eyes(:one)
  end

  test "should get index" do
    get eyes_url
    assert_response :success
  end

  test "should get new" do
    get new_eye_url
    assert_response :success
  end

  test "should create eye" do
    assert_difference('Eye.count') do
      post eyes_url, params: { eye: { viewee: @eye.viewee, viewer: @eye.viewer } }
    end

    assert_redirected_to eye_url(Eye.last)
  end

  test "should show eye" do
    get eye_url(@eye)
    assert_response :success
  end

  test "should get edit" do
    get edit_eye_url(@eye)
    assert_response :success
  end

  test "should update eye" do
    patch eye_url(@eye), params: { eye: { viewee: @eye.viewee, viewer: @eye.viewer } }
    assert_redirected_to eye_url(@eye)
  end

  test "should destroy eye" do
    assert_difference('Eye.count', -1) do
      delete eye_url(@eye)
    end

    assert_redirected_to eyes_url
  end
end
