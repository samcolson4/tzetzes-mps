require 'rails_helper'

feature "User can view all articles" do
  scenario "User can view a list of all articles" do
    create_article
    sign_up
    expect(page).to have_content("Articles")
    click_link("Articles")
    expect(page).to have_content("All articles")
    expect(page).to have_content("MP saves dog")
  end

  scenario "User can search for a specific article" do
     create_article
     sign_up
     find(:css, "input[id$='search']").set("Dog")
     click_button "Search"
     expect(page).to have_current_path("/search?search=Dog")
     expect(page).to have_content("MP saves dog")
  end

  scenario "User is told if no articles match query" do
    # create_article
    sign_up
    find(:css, "input[id$='search']").set("Dog")
    click_button "Search"
    expect(page).to have_current_path("/search?search=Dog")
    expect(page).to have_content("No results. Return home.")
 end

  # scenario "User can view MPs on further pages of the site" do
  #   sign_up
  #   click_link("MPs")
  #   click_link("3")
  #   expect(page).to have_content("Robert Courts MP")
  # end

end
