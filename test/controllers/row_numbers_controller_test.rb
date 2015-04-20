require 'test_helper'

class RowNumbersControllerTest < ActionController::TestCase
  setup do
    @row_number = row_numbers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:row_numbers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create row_number" do
    assert_difference('RowNumber.count') do
      post :create, row_number: { row_number: @row_number.row_number }
    end

    assert_redirected_to row_number_path(assigns(:row_number))
  end

  test "should show row_number" do
    get :show, id: @row_number
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @row_number
    assert_response :success
  end

  test "should update row_number" do
    patch :update, id: @row_number, row_number: { row_number: @row_number.row_number }
    assert_redirected_to row_number_path(assigns(:row_number))
  end

  test "should destroy row_number" do
    assert_difference('RowNumber.count', -1) do
      delete :destroy, id: @row_number
    end

    assert_redirected_to row_numbers_path
  end
end
