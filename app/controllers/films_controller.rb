require 'net/http'
require 'open-uri'
require 'json'

class FilmsController < ApplicationController

  def show
    uri = URI('https://swapi.co/api/films/' + params['id'] + '/')
    req = Net::HTTP::get(uri)
    @film = JSON.parse(req)
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
