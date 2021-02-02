require 'test_helper'

class RentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rent = rents(:one)
  end

  test "should get index" do
    get rents_url
    assert_response :success
  end

  test "should get new" do
    get new_rent_url
    assert_response :success
  end

  test "should create rent" do
    assert_difference('Rent.count') do
      post rents_url, params: { rent: { deposit: @rent.deposit, from: @rent.from, paymant_date: @rent.paymant_date, property_id: @rent.property_id, rent: @rent.rent, tenant_id: @rent.tenant_id, to: @rent.to } }
    end

    assert_redirected_to rent_url(Rent.last)
  end

  test "should show rent" do
    get rent_url(@rent)
    assert_response :success
  end

  test "should get edit" do
    get edit_rent_url(@rent)
    assert_response :success
  end

  test "should update rent" do
    patch rent_url(@rent), params: { rent: { deposit: @rent.deposit, from: @rent.from, paymant_date: @rent.paymant_date, property_id: @rent.property_id, rent: @rent.rent, tenant_id: @rent.tenant_id, to: @rent.to } }
    assert_redirected_to rent_url(@rent)
  end

  test "should destroy rent" do
    assert_difference('Rent.count', -1) do
      delete rent_url(@rent)
    end

    assert_redirected_to rents_url
  end
end
