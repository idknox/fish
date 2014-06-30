require 'spec_helper'

feature "Homepage" do
  scenario "should have a greeting" do
    visit "/"

    expect(page).to have_content("Fish Homepage")
  end

  scenario "should see a list of three fish" do
    visit "/"

    expect(page).to have_content("Pufferfish", "Clownfish", "Swordfish")
  end

  scenario "clicking fish should take me to fish page" do
    visit "/"

    click_link "Clownfish"

    expect(page).to have_content("salt water", "Amphiprioninae", 'a href="http://upload.wikimedia.org/wikipedia/commons/thumb/f/f6/Clown_fish_in_the_Andaman_Coral_Reef.jpg/250px-Clown_fish_in_the_Andaman_Coral_Reef.jpg">')
  end

  scenario "adding a fish should take me to a new page and display the fish" do
    visit "/"

    click_link "New Fish"

    fill_in "new_fish", :with => "Halibut"

    click_button "Submit"

    click_link "Homepage"

    expect(page).to have_content("Halibut")

  end

  scenario "searching for fish" do
    visit "/"

    fill_in "search_fish", :with => "Clownfish"

    click_button "Search"

    expect(page).to have_content("Amphiprioninae")
  end

  scenario "searching for fish" do
    visit "/"

    fill_in "search_fish", :with => "nooooope"

    click_button "Search"

    expect(page).to have_content("Sorry. We couldn't find your fish.")
  end
end

feature "Fish Page" do
  scenario "clicking link takes me to a Wikipedia page" do

  visit "/Clownfish"

  expect(page).to have_link("Wiki", href: "http://en.wikipedia.org/wiki/Amphiprioninae")
  end
end

feature "Fish's Home Page" do
  scenario "clicking Home on fish page takes you to fish list" do

    visit "/Clownfish"

    expect(page).to have_link("Home", href: "/")
  end
end

