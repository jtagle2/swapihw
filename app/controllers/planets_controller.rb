class PlanetsController < ApplicationController

  def index
    uri = URI('https://swapi.co/api/planets/')
    req = Net::HTTP::get(uri)
  end

  def show
    @planet = get_specific('https://swapi.co/api/planets/' + params['id'] + '/')
    aux = Array.new()
    @planet['residents'] = get_urls(@planet['residents'])
  end

end
