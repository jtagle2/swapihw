require 'net/http'
require 'open-uri'
require 'json'

class PlanetsController < ApplicationController

  def index
    uri = URI('https://swapi.co/api/films/')
    req = Net::HTTP::get(uri)
  end

end
