require 'rubygems'
require 'sinatra'
require 'rest-client'

get '/' do
  File.read(File.join('public', 'index.html'))
end

configure :production do
end

post '/ipn' do
  url = "https://www.sandbox.paypal.com/cgi-bin/webscr"
  body = request.body.string
  RestClient.post url, body
  File.open("ipn.txt", 'a') {|f| f.write(body) }
end
