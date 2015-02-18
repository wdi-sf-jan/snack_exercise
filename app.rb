require 'sinatra'
require 'sinatra/activerecord'
require './models/snack'

get '/' do
  redirect '/snacks'
end

get '/snacks' do
  @snacks = Snack.all
  erb :index
end

get '/snacks/new' do
  erb :new
end

get '/snacks/:id' do
  @snack = Snack.find(params[:id])
  erb :show
end

get '/snacks/:id/edit' do
  @snack = Snack.find(params[:id])
  erb :edit
end

post '/snacks' do
  Snack.create({:name => params[:snack_name]})
  redirect '/snacks'
end

put '/snacks/:id' do
  snack = Snack.find(params[:id])
  snack.name = params[:snack_name]
  snack.save
  # could have also used update()
  redirect '/snacks'
end

delete '/snacks/:id' do
  snack = Snack.find(params[:id])
  snack.destroy
  redirect '/snacks'
end
