class PlayersController < ApplicationController

    get '/players' do
        @players = Player.all
        erb :"/players/index"
    end

    get '/players/:id' do 
        @player = Player.find_by_id(params[:id])
        erb :"players/show"
    end


end
