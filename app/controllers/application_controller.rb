require 'net/http'
require 'open-uri'
require 'json'

class ApplicationController < ActionController::Base

  def get_specific(url)
    uri = URI(url)
    req = Net::HTTP::get(uri)
    ret = JSON.parse(req)
    ret["uri"] = URI(ret["url"]).path.sub("/api", "")
    return ret
  end

  def get_all(url)
    ret = Array.new()
    req = {"next" => url}
    while !req["next"].nil?
      uri = URI(req["next"])
      req = JSON.parse(Net::HTTP::get(uri))
      ret += req['results']
    end
    ret.each do |element|
      element["uri"] = URI(element["url"]).path.sub("/api", "")
    end
    return ret
  end

  def get_urls(urls)
    aux = Array.new()
    urls.each do |url|
      aux.push(get_specific(url))
    end
    return aux
  end

end
