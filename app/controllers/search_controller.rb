class SearchController < ApplicationController

  def index
    @stations = Search.retrieve_stations(params[:zip])
    byebug
  end

end
