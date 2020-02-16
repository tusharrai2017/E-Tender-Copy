require "application_system_test_case"

class TendersTest < ApplicationSystemTestCase
  setup do
    @tender = tenders(:one)
  end

  test "visiting the index" do
    visit tenders_url
    assert_selector "h1", text: "Tenders"
  end

  test "creating a Tender" do
    visit tenders_url
    click_on "New Tender"

    fill_in "Body", with: @tender.body
    fill_in "Title", with: @tender.title
    click_on "Create Tender"

    assert_text "Tender was successfully created"
    click_on "Back"
  end

  test "updating a Tender" do
    visit tenders_url
    click_on "Edit", match: :first

    fill_in "Body", with: @tender.body
    fill_in "Title", with: @tender.title
    click_on "Update Tender"

    assert_text "Tender was successfully updated"
    click_on "Back"
  end

  test "destroying a Tender" do
    visit tenders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tender was successfully destroyed"
  end
end
