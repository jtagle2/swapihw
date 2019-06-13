class WelcomeController < ApplicationController

  def filmes
  end


  def index
    body = {"query": "query{allFilms{edges{node{title,releaseDate,episodeID,director,producers,id}}}}"}
    movies = post_request(body)
    @films = movies['allFilms']['edges'].collect{|edge| edge['node']}
  end

end
