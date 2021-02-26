require "application_system_test_case"

class AgreementsTest < ApplicationSystemTestCase
  setup do
    @agreement = agreements(:one)
  end

  test "visiting the index" do
    visit agreements_url
    assert_selector "h1", text: "agreements"
  end

  test "creating a Agreement" do
    visit agreements_url
    click_on "New Agreement"

    fill_in "Deposit", with: @agreement.deposit
    fill_in "From", with: @agreement.from
    fill_in "Payment date", with: @agreement.payment_date
    fill_in "Property", with: @agreement.property_id
    fill_in "Rent", with: @agreement.rent
    fill_in "Tenant", with: @agreement.tenant_id
    fill_in "To", with: @agreement.to
    click_on "Create Agreement"

    assert_text "Agreement was successfully created"
    click_on "Back"
  end

  test "updating a Agreement" do
    visit agreements_url
    click_on "Edit", match: :first

    fill_in "Deposit", with: @agreement.deposit
    fill_in "From", with: @agreement.from
    fill_in "Payment date", with: @agreement.payment_date
    fill_in "Property", with: @agreement.property_id
    fill_in "Rent", with: @agreement.rent
    fill_in "Tenant", with: @agreement.tenant_id
    fill_in "To", with: @agreement.to
    click_on "Update Agreement"

    assert_text "Agreement was successfully updated"
    click_on "Back"
  end

  test "destroying a Agreement" do
    visit agreements_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Agreement was successfully deleted"
  end
end
