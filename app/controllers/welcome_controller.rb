class WelcomeController < ApplicationController

  def index
    @films = get_all('https://swapi.co/api/films/')
  end

end
