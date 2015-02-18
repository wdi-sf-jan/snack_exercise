require 'sinatra'
require 'sinatra/activerecord'

get '/' do
  redirect '/snacks'
end

get '/snacks' do
  "Hello, Snacks!"
end
