class PlanetsController < ApplicationController

  def show
  	body = Hash.new
	body['query'] = 'query{planet(id: "%s"){filmConnection{edges{node{title, id}}},residentConnection{edges{node{name, id}}},name,diameter,rotationPeriod,orbitalPeriod,gravity,population,climates,terrains,surfaceWater}}
' % [params['id']]
	@planet = post_request(body)['planet']
	@planet['films'] = @planet['filmConnection']['edges'].collect{|edge| edge['node']}
	@planet['residents'] = @planet['residentConnection']['edges'].collect{|edge| edge['node']}
  end

end
