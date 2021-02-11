require 'test_helper'

class DueTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @due_type = due_types(:one)
  end

  test "should get index" do
    get due_types_url
    assert_response :success
  end

  test "should get new" do
    get new_due_type_url
    assert_response :success
  end

  test "should create due_type" do
    assert_difference('DueType.count') do
      post due_types_url, params: { due_type: { name: @due_type.name } }
    end

    assert_redirected_to due_type_url(DueType.last)
  end

  test "should show due_type" do
    get due_type_url(@due_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_due_type_url(@due_type)
    assert_response :success
  end

  test "should update due_type" do
    patch due_type_url(@due_type), params: { due_type: { name: @due_type.name } }
    assert_redirected_to due_type_url(@due_type)
  end

  test "should destroy due_type" do
    assert_difference('DueType.count', -1) do
      delete due_type_url(@due_type)
    end

    assert_redirected_to due_types_url
  end
end
