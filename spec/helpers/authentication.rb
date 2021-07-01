def sign_up_basic
  visit "/"
  click_link "Register"
  fill_in "user_name", with: "Bob"
  fill_in "Surname", with: "Bobby"
  fill_in "Email", with: "bob@test.com"
  fill_in "Password", with: "Bobobobob"
  fill_in "Password confirmation", with: "Bobobobob"
  click_button "Sign up"
  User.find_by(email: "bob@test.com").confirm
end

def sign_up_sign_in
  visit "/"
  click_link "Register"
  fill_in "user_name", with: "Bob"
  fill_in "Surname", with: "Bobby"
  fill_in "Email", with: "bob@test.com"
  fill_in "Password", with: "Bobobobob"
  fill_in "Password confirmation", with: "Bobobobob"
  click_button "Sign up"
  User.find_by(email: "bob@test.com").confirm
  visit "/"
  click_link "Sign in"
  fill_in "Email", with: "bob@test.com"
  fill_in "Password", with: "Bobobobob"
  click_button "Log in"
end

def sign_out_basic
  visit "/"
  click_link "Sign out"
  visit "/"
end
