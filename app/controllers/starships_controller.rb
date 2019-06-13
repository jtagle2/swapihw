class StarshipsController < ApplicationController

  def show
  	body = Hash.new
	body['query'] = 'query{starship(id: "%s"){filmConnection{edges{node{title, id}}},pilotConnection{edges{node{name, id}}},name,starshipClass,manufacturers,costInCredits,length,crew,passengers,maxAtmospheringSpeed,hyperdriveRating,MGLT,cargoCapacity,consumables,model}}
' % [params['id']]
	puts post_request(body)
	@starship = post_request(body)['starship']
	@starship['pilots'] = @starship['pilotConnection']['edges'].collect{|edge| edge['node']}
	@starship['films'] = @starship['filmConnection']['edges'].collect{|edge| edge['node']}
    #@starship = get_specific('https://swapi.co/api/starships/' + params['id'] + '/')
    #@starship['films'] = get_urls(@starship['films'])
    #@starship['pilots'] = get_urls(@starship['pilots'])
  end

end
