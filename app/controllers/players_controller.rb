class PlayersController < ApplicationController

    get '/players' do
        @players = Player.all
        erb :"/players/index"
    end

    get '/players/new' do
        #create form
        erb :"/players/new"
        end

    get '/players/:id' do 
        @player = Player.find_by_id(params[:id])
        erb :"players/show"
    end

    post '/players' do
        player = Player.create(params[:player])

        redirect "/players/#{player.id}"
    end

    get "/players/:id/edit" do 
        #create edit
        @player = Player.find_by(id:params[:id])
        erb :"players/edit"
    end

    patch '/players/:id' do
        player = Player.find_by(id:params[:id])
        player.update(params[:player])
        redirect "/players/#{player.id}"
    end

end
