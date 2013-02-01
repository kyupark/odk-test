require 'rubygems'
require 'sinatra'
require 'rest-client'
require 'slim'

get '/' do
  File.read(File.join('public', 'index.html'))
end

not_found do
  redirect to('/')
end

get '/donate' do
  slim :donate
end

post '/ipn' do
  url = "https://www.sandbox.paypal.com/cgi-bin/webscr"
  body = request.body.string
  RestClient.post url, body

  File.open("paypal_ipn.csv", 'a') {|f| f.puts(body) }
end

configure :production do
end
