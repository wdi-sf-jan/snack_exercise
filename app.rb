require 'sinatra'

get '/' do
  redirect '/snacks'
end

get '/snacks' do
  "Hello, Snacks!"
end
