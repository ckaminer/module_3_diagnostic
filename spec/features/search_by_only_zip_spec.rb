require "rails_helper"

RSpec.feature "user searches stations by only zip code" do
  describe "they enter a valid zip code" do
    scenario "they see a list of the 10 closest stations within 6 miles sorted by distance" do
        visit "/"
        fill_in "zip", with: "80203"
        click_on "Locate"

        expect(current_path).to eq "/search?zip=80203"
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
