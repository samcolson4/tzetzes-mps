require 'rails_helper'

feature "User can view all MPs" do
  scenario "User can sign in using email address and password" do
    sign_up
    expect(page).to have_content("MPs")
    click_link("MPs")
    expect(page).to have_content("Diane Abbott MP")
  end

  # scenario "User sees an error with an incorrect email / password" do
  #   sign_up
  #   sign_out
  #   expect(page).to have_content("Register")
  #   click_link("Sign in")
  #   fill_in "Email", with: "bo@test.com"
  #   fill_in "Password", with: "Bobobobob"
  #   click_button("Log in")
  #   expect(page).to have_content("Invalid Email or password.")
  # end
end
