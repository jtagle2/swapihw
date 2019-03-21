require 'net/http'
require 'open-uri'
require 'json'

class FilmsController < ApplicationController

  def show
    puts params['id']
    uri = URI('https://swapi.co/api/films/' + params['id'] + '/')
    req = Net::HTTP::get(uri)
    @film = JSON.parse(req)
  end

end
