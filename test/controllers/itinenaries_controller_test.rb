require 'test_helper'

class ItinenariesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @itinenary = itinenaries(:one)
  end

  test "should get index" do
    get itinenaries_url
    assert_response :success
  end

  test "should get new" do
    get new_itinenary_url
    assert_response :success
  end

  test "should create itinenary" do
    assert_difference('Itinenary.count') do
      post itinenaries_url, params: { itinenary: { country: @itinenary.country, state: @itinenary.state } }
    end

    assert_redirected_to itinenary_url(Itinenary.last)
  end

  test "should show itinenary" do
    get itinenary_url(@itinenary)
    assert_response :success
  end

  test "should get edit" do
    get edit_itinenary_url(@itinenary)
    assert_response :success
  end

  test "should update itinenary" do
    patch itinenary_url(@itinenary), params: { itinenary: { country: @itinenary.country, state: @itinenary.state } }
    assert_redirected_to itinenary_url(@itinenary)
  end

  test "should destroy itinenary" do
    assert_difference('Itinenary.count', -1) do
      delete itinenary_url(@itinenary)
    end

    assert_redirected_to itinenaries_url
  end
end
