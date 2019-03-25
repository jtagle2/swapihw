class WelcomeController < ApplicationController

  def index
    @films = get_all('https://swapi.co/api/films/')
  end

  def search
    search_param = params['name']
    @films = get_all('https://swapi.co/api/films/?search=' + search_param)
    @starships = get_all('https://swapi.co/api/starships/?search=' + search_param)
    @people = get_all('https://swapi.co/api/people/?search=' + search_param)
    @planets = get_all('https://swapi.co/api/planets/?search=' + search_param)
  end

end
