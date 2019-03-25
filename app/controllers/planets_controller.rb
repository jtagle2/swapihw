class PlanetsController < ApplicationController

  def show
    @planet = get_specific('https://swapi.co/api/planets/' + params['id'] + '/')
    @planet['residents'] = get_urls(@planet['residents'])
    @planet['films'] = get_urls(@planet['films'])
  end

end
