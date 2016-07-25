class SearchService

  def initialize
    @_connection = Faraday.new("https://developer.nrel.gov")
  end

  def get_stations(zip, distance = 6)
    response = connection.get("/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV["nrel_api_key"]}&location=#{zip}&fuel_type=ELEC,LPG&limit=10&radius=#{distance}")
    json = parse(response)
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

private
  def connection
    @_connection
  end

end
