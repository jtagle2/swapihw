class WelcomeController < ApplicationController

  def index
    @films = get_all('https://swapi.co/api/films/')
    @films.each do |film|
      film["uri"] = URI(film["url"]).path.sub("/api", "")
    end
  end

end
