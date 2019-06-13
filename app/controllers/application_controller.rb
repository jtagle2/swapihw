require 'net/http'
require 'open-uri'
require 'json'

class ApplicationController < ActionController::Base

  BaseURL = "https://swapi-graphql-integracion-t3.herokuapp.com/"

  def post_request(body, url=BaseURL)
    uri = URI(url)
    req = Net::HTTP::Post.new(uri)
    req['content-type'] = 'application/json'
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = (uri.scheme == 'https')
    req.body = body.to_json
    response = http.request(req)
    response = JSON.parse(response.body)
    return response['data']
  end
  
end
