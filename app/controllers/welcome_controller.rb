class WelcomeController < ApplicationController

  def index
    uri = URI('https://swapi.co/api/films/')
    req = Net::HTTP::get(uri)
    @films = JSON.parse(req)['results']
    @films = get_all('https://swapi.co/api/films/')
    @films.each do |film|
      film["uri"] = URI(film["url"]).path.sub("/api", "")
    end
  end

end
