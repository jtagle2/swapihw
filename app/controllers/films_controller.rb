class FilmsController < ApplicationController

  def show
    @film = get_specific('https://swapi.co/api/films/' + params['id'] + '/')
    @film['planets'] = get_urls(@film['planets'])
  end

end
