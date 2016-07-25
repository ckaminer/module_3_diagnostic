require "rails_helper"

RSpec.feature "user searches stations by zip code and distance" do
  describe "they enter a valid zip code and distance" do
    scenario "they see a list of the 10 closest stations within the given distance" do
        visit "/"
        fill_in "zip", with: "80203"
        fill_in "distance", with: "5"
        click_on "Locate"

        expect(page).to have_content "Station Name"
        expect(page).to have_content "Fuel Type"
        expect(page).to have_content "Distance"
        expect(page).to have_content "Address"
        expect(page).to have_content "Access Times"
        expect(page).to_not have_content "Biodiesel"
        expect(page).to_not have_content "Compressed Natural Gas"
    end
  end
end
