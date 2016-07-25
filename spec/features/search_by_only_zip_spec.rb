require "rails_helper"

RSpec.feature "user searches stations by only zip code" do
  describe "they enter a valid zip code"
    scenario "they see a list of the 10 closest stations within 6 miles sorted by distance" do
        visit "/"
        fill_in "q", with: "80203"

        expect(current_path).to eq "/search?zip=80203"
        
    end
  end
end
