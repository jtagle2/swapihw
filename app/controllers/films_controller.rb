require 'net/http'
require 'open-uri'
require 'json'

class FilmsController < ApplicationController

  def show
  body = Hash.new
	body['query'] = 'query{film(id: "%s"){planetConnection{edges{node{name, id}}},starshipConnection{edges{node{name, id}}},title,releaseDate,episodeID,director,producers,openingCrawl,id,characterConnection{edges{node{id, name}}}}}
' % [params['id']]
	@film = post_request(body)['film']
	@film['planets'] = @film['planetConnection']['edges'].collect{|edge| edge['node']}
	@film['characters'] = @film['characterConnection']['edges'].collect{|edge| edge['node']}
  @film['starships'] = @film['starshipConnection']['edges'].collect{|edge| edge['node']}
  end


end
