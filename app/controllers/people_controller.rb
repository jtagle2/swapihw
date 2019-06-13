class PeopleController < ApplicationController

  def show
  	body = Hash.new
	body['query'] = 'query{person(id: "%s"){species{name},filmConnection{edges{node{title, id}}},starshipConnection{edges{node{name, id}}},name,id,birthYear,eyeColor,gender,hairColor,height,mass,skinColor,homeworld{name, id}}}
' % [params['id']]
	@character = post_request(body)['person']
	@character['starships'] = @character['starshipConnection']['edges'].collect{|edge| edge['node']}
	@character['films'] = @character['filmConnection']['edges'].collect{|edge| edge['node']}
  end

end
