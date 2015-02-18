require 'sinatra'
require 'sinatra/activerecord'
require './models/snack'

get '/' do
  redirect '/snacks'
end

get '/snacks' do
  "Hello, Snacks!"
end
