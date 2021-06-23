require 'rails_helper'

feature "User can view all articles" do
  scenario "User can view all articles" do
    sign_up
    expect(page).to have_content("Articles")
    click_link("Articles")
    expect(page).to have_content("All articles")
  end

  # scenario "User can view MPs on further pages of the site" do
  #   sign_up
  #   click_link("MPs")
  #   click_link("3")
  #   expect(page).to have_content("Robert Courts MP")
  # end

end
