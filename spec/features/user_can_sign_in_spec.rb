require 'rails_helper'

feature "Sign in" do
  scenario "User can sign in using email address and password" do
    sign_up_sign_in
    sign_out_basic
    expect(page).to have_content("Register")
    click_link("Sign in")
    fill_in "Email", with: "bob@test.com"
    fill_in "Password", with: "Bobobobob"
    click_button("Log in")
    expect(page).to have_content("Signed in successfully.")
  end

  scenario "User sees an error with an incorrect email / password" do
    sign_up_sign_in
    sign_out_basic
    expect(page).to have_content("Register")
    click_link("Sign in")
    fill_in "Email", with: "bo@test.com"
    fill_in "Password", with: "Bobobobob"
    click_button("Log in")
    expect(page).to have_content("Invalid Email or password.")
  end
end
