require 'net/http'
require 'open-uri'
require 'json'

class WelcomeController < ApplicationController

  def index
    uri = URI('https://swapi.co/api/films/')
    req = Net::HTTP::get(uri)
    @films = JSON.parse(req)['results']
  end

end
