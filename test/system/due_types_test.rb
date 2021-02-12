require "application_system_test_case"

class DueTypesTest < ApplicationSystemTestCase
  setup do
    @due_type = due_types(:one)
  end

  test "visiting the index" do
    visit due_types_url
    assert_selector "h1", text: "Due Types"
  end

  test "creating a Due type" do
    visit due_types_url
    click_on "New Due Type"

    fill_in "Name", with: @due_type.name
    click_on "Create Due type"

    assert_text "Due type was successfully created"
    click_on "Back"
  end

  test "updating a Due type" do
    visit due_types_url
    click_on "Edit", match: :first

    fill_in "Name", with: @due_type.name
    click_on "Update Due type"

    assert_text "Due type was successfully updated"
    click_on "Back"
  end

  test "destroying a Due type" do
    visit due_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Due type was successfully deleted"
  end
end
