require 'rubygems'
require 'sinatra'
require 'net/http'
require 'rest_client'

get '/' do
  File.read(File.join('public', 'index.html'))
end

configure :production do
end

post '/ipn1' do
  url       = params[:url]
  raw_post  = request.env["rack.input"].read
  res       = Net::HTTP.post_form(URI.parse(url), raw_post)
  
  
end

post '/ipn2' do
  url = "https://www.sandbox.paypal.com/cgi-bin/webscr"
  body = request.body.string
  RestClient.post url, body
  
  
end
