def sign_up
  visit "/"
  click_link "Register"
  fill_in "user_name", with: "Bob"
  fill_in "Surname", with: "Bobby"
  fill_in "Email", with: "bob@test.com"
  fill_in "Password", with: "Bobobobob"
  click_button "Sign up"
end