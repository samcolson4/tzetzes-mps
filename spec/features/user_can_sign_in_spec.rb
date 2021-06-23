require 'rails_helper'

feature "Sign in" do
  scenario "User can sign in using email address and password" do
    sign_up
    sign_out
    expect(page).to have_content("Register")
    click_link("Sign in")
    fill_in "Email", with: "bob@test.com"
    fill_in "Password", with: "Bobobobob"
    click_button("Log in")
    expect(page).to have_content("Signed in successfully.")
  end
end
