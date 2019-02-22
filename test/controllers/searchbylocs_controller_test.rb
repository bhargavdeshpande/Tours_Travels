require 'test_helper'

class SearchbylocsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @searchbyloc = searchbylocs(:one)
  end

  test "should get index" do
    get searchbylocs_url
    assert_response :success
  end

  test "should get new" do
    get new_searchbyloc_url
    assert_response :success
  end

  test "should create searchbyloc" do
    assert_difference('Searchbyloc.count') do
      post searchbylocs_url, params: { searchbyloc: {  } }
    end

    assert_redirected_to searchbyloc_url(Searchbyloc.last)
  end

  test "should show searchbyloc" do
    get searchbyloc_url(@searchbyloc)
    assert_response :success
  end

  test "should get edit" do
    get edit_searchbyloc_url(@searchbyloc)
    assert_response :success
  end

  test "should update searchbyloc" do
    patch searchbyloc_url(@searchbyloc), params: { searchbyloc: {  } }
    assert_redirected_to searchbyloc_url(@searchbyloc)
  end

  test "should destroy searchbyloc" do
    assert_difference('Searchbyloc.count', -1) do
      delete searchbyloc_url(@searchbyloc)
    end

    assert_redirected_to searchbylocs_url
  end
end
