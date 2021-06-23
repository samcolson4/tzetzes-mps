require 'rails_helper'

feature "Signup" do
  scenario "Can sign up with name, email and password" do
    visit "/"
    click_link "Register"
    expect(page).to have_content("First name")
    fill_in "user_name", with: "Bob"
    fill_in "Surname", with: "Bobby"
    fill_in "Email", with: "bob@test.com"
    fill_in "Password", with: "Bobobobob"
    click_button "Sign up"
    expect(page).to have_content("Search")
  end

  scenario "Displays error when name, email or password not provided" do
    visit "/users/sign_up"
    fill_in "user_name", with: "Bob"
    fill_in "Surname", with: "Bobby"
    fill_in "Email", with: ""
    fill_in "Password", with: ""
    click_button "Sign up"    
    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("Password can't be blank")
  end

  scenario "it prevents singup with duplicated email address" do
    sign_up
    click_link "Sign out"
    sign_up
    expect(page).to have_content("Email has already been taken")
  end

end
