class StarshipsController < ApplicationController

  def show
    @starship = get_specific('https://swapi.co/api/starships/' + params['id'] + '/')
    @starship['films'] = get_urls(@starship['films'])
    @starship['pilots'] = get_urls(@starship['pilots'])
  end

end
