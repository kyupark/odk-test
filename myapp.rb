require 'sinatra'

get '/' do
  File.read(File.join('public', 'index.html'))
end

get '/:filename' do
  File.read(File.join('public', ':filename'))
end