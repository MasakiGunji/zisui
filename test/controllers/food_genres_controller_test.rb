require 'test_helper'

class FoodGenresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get food_genres_index_url
    assert_response :success
  end

  test "should get create" do
    get food_genres_create_url
    assert_response :success
  end

  test "should get edit" do
    get food_genres_edit_url
    assert_response :success
  end

  test "should get update" do
    get food_genres_update_url
    assert_response :success
  end

  test "should get show" do
    get food_genres_show_url
    assert_response :success
  end

end
