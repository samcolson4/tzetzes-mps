require 'rails_helper'

feature "User can view the api explanation page" do
  scenario "User can view the privacy policy page" do
    visit "/api"
    expect(page).to have_content("$ curl tzetzes.com")
  end

  scenario "User can view the API page, after clicking the link in the header" do
    sign_up_sign_in
    visit "/about"
    click_link("API")
    expect(page).to have_content("$ curl tzetzes.com")
  end
end
