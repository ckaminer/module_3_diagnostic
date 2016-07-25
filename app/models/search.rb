class Search < OpenStruct

  def self.service
    @@service ||= SearchService.new
  end

  def self.retrieve_stations(zip)
    stations = service.get_stations(zip)
    Search.new(stations)
  end

end
