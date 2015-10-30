require 'sinatra/base'
require_relative './lib/player'

class Rps < Sinatra::Base
  
  get '/' do
    erb :index
  end

  post '/name' do
    p params
    $player = Player.new(params[:player_name])
    redirect '/play'
  end

  get '/play' do
    $player
    erb :play
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
