require 'test_helper'

class ColorPositionsControllerTest < ActionController::TestCase
  setup do
    @color_position = color_positions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:color_positions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create color_position" do
    assert_difference('ColorPosition.count') do
      post :create, color_position: { color_id: @color_position.color_id, position: @color_position.position }
    end

    assert_redirected_to color_position_path(assigns(:color_position))
  end

  test "should show color_position" do
    get :show, id: @color_position
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @color_position
    assert_response :success
  end

  test "should update color_position" do
    patch :update, id: @color_position, color_position: { color_id: @color_position.color_id, position: @color_position.position }
    assert_redirected_to color_position_path(assigns(:color_position))
  end

  test "should destroy color_position" do
    assert_difference('ColorPosition.count', -1) do
      delete :destroy, id: @color_position
    end

    assert_redirected_to color_positions_path
  end
end
