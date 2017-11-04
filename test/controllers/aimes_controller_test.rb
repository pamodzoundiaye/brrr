require 'test_helper'

class AimesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @aime = aimes(:one)
  end

  test "should get index" do
    get aimes_url
    assert_response :success
  end

  test "should get new" do
    get new_aime_url
    assert_response :success
  end

  test "should create aime" do
    assert_difference('Aime.count') do
      post aimes_url, params: { aime: { liked: @aime.liked, liker: @aime.liker } }
    end

    assert_redirected_to aime_url(Aime.last)
  end

  test "should show aime" do
    get aime_url(@aime)
    assert_response :success
  end

  test "should get edit" do
    get edit_aime_url(@aime)
    assert_response :success
  end

  test "should update aime" do
    patch aime_url(@aime), params: { aime: { liked: @aime.liked, liker: @aime.liker } }
    assert_redirected_to aime_url(@aime)
  end

  test "should destroy aime" do
    assert_difference('Aime.count', -1) do
      delete aime_url(@aime)
    end

    assert_redirected_to aimes_url
  end
end
