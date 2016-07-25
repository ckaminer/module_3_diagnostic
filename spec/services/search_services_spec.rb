require "rails_helper"

describe SearchService do
  context "#search" do
    it "they see a list of the 10 closest stations within 6 miles sorted by distance" do
      VCR.use_cassette("zip") do
        zip = 80203
        stations = SearchService.new.get_stations(zip)

        expect(stations[:fuel_stations].first[:station_name]).to eq "CADACHARGEPOINT"
      end
    end
  end
end
