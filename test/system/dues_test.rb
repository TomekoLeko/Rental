require "application_system_test_case"

class DuesTest < ApplicationSystemTestCase
  setup do
    @due = dues(:one)
  end

  test "visiting the index" do
    visit dues_url
    assert_selector "h1", text: "Dues"
  end

  test "creating a Due" do
    visit dues_url
    click_on "New Due"

    fill_in "Amount", with: @due.amount
    fill_in "Paid amount", with: @due.paid_amount
    fill_in "Paid on", with: @due.paid_on
    fill_in "Payment date", with: @due.payment_date
    fill_in "Period from", with: @due.period_from
    fill_in "Period to", with: @due.period_to
    fill_in "Property", with: @due.property_id
    fill_in "Agreement", with: @due.agreement_id
    fill_in "Tenant", with: @due.tenant_id
    fill_in "Type", with: @due.type_id
    click_on "Create Due"

    assert_text "Due was successfully created"
    click_on "Back"
  end

  test "updating a Due" do
    visit dues_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @due.amount
    fill_in "Paid amount", with: @due.paid_amount
    fill_in "Paid on", with: @due.paid_on
    fill_in "Payment date", with: @due.payment_date
    fill_in "Period from", with: @due.period_from
    fill_in "Period to", with: @due.period_to
    fill_in "Property", with: @due.property_id
    fill_in "Agreement", with: @due.agreement_id
    fill_in "Tenant", with: @due.tenant_id
    fill_in "Type", with: @due.type_id
    click_on "Update Due"

    assert_text "Due was successfully updated"
    click_on "Back"
  end

  test "destroying a Due" do
    visit dues_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Due was successfully deleted"
  end
end
