class FilmsController < ApplicationController

  def show
    @film = get_specific('https://swapi.co/api/films/' + params['id'] + '/')
    planets = Array.new()
    @film['planets'].each do |url|
      uri = URI(url)
      req = Net::HTTP::get(uri)
      planet = JSON.parse(req)
      planet = {
              'uri': uri.path.sub('/api', ''),
              'name': planet['name']
              }
      planets.push(planet)
    end
    @film['planets'] = planets
  end

end
