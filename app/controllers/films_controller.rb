class FilmsController < ApplicationController

  def show
    @film = get_specific('https://swapi.co/api/films/' + params['id'] + '/')
    planets = Array.new()
    @film['planets'].each do |url|
      planet = get_specific(url)
      planet = {
              'uri': URI(url).path.sub('/api', ''),
              'name': planet['name']
              }
      planets.push(planet)
    end
    @film['planets'] = planets
  end

end
