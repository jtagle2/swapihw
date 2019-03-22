require 'net/http'
require 'open-uri'
require 'json'

class ApplicationController < ActionController::Base

  def get_specific(url)
    uri = URI(url)
    req = Net::HTTP::get(uri)
    JSON.parse(req)
  end

  def get_all(url)
    ret = Array.new()
    req = {"next" => url}
    while !req["next"].nil?
      puts req["next"]
      uri = URI(req["next"])
      req = JSON.parse(Net::HTTP::get(uri))
      ret += req['results']
    end
    return ret
  end
end
