require 'rails_helper'

feature "User can view the privacy policy page" do
  scenario "User can view the privacy policy page" do
    sign_up_sign_in
    visit "/about/privacy"
    expect(page).to have_content("Privacy policy")
  end

  scenario "User can view the privacy policy page, after clicking the link in about" do
    sign_up_sign_in
    visit "/about"
    click_link("Privacy Policy")
    expect(page).to have_content("Privacy policy")
  end
end
