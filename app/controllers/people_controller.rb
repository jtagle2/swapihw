class PeopleController < ApplicationController

  def show
    @character = get_specific('https://swapi.co/api/people/' + params['id'] + '/')
    @character['starships'] = get_urls(@character['starships'])
    @character['films'] = get_urls(@character['films'])
    @character['homeworld'] = get_specific(@character['homeworld'])
  end

end
