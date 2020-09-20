class PlayersController < ApplicationController

    get '/players' do
        @players = current_user.players
        erb :"/players/index"
    end

    get '/players/new' do
        erb :"/players/new"
        end

    get '/players/:id' do 
        if session[:user_id]
        @player = Player.find_by_id(params[:id])
        erb :"players/show"
        else
            redirect "/"
        end
    end

    post '/players' do
        #params[:player][:user_id] = current_user
        player = current_user.players.create(params[:player])
        #player = Player.create(params[:player])

        #redirect "/players/#{player.id}"
        redirect '/players'
    end

    get "/players/:id/edit" do 
        @player = Player.find_by(id:params[:id])
        erb :"players/edit"
    end

    patch '/players/:id' do
        player = Player.find_by(id:params[:id])
        # if player.user_id == session[:user_id]
        if current_user.id = player.team_id
            player.update(params[:player])
            redirect "/players/#{player.id}"
        end
    end

    delete "/players/:id" do
        player = Player.find_by(id:params[:id])
        player.destroy
        redirect "/players"
    end

end
