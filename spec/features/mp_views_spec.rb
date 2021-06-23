require 'rails_helper'

feature "User can view all MPs" do
  scenario "User can sign in using email address and password" do
    sign_up
    expect(page).to have_content("MPs")
    click_link("MPs")
    expect(page).to have_content("Diane Abbott MP")
  end

  scenario "User can view MPs on further pages of the site" do
    sign_up
    click_link("MPs")
    click_link("3")
    expect(page).to have_content("Robert Courts MP")
  end

end
