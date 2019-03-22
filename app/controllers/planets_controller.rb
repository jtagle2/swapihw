class PlanetsController < ApplicationController

  def index
    uri = URI('https://swapi.co/api/planets/')
    req = Net::HTTP::get(uri)
  end

  def show
    @planet = get_specific('https://swapi.co/api/planets/' + params['id'] + '/')
  end

end
