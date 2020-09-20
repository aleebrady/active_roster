class TeamsController < ApplicationController

    get '/signup' do
        erb :"/teams/signup"
    end

    post '/teams' do
        if params[:password] == params[:password_confirm]
            params.delete(:password_confirm)
            team = Team.new(params)
            if team.save 
                session[:user_id] = team.id 
                redirect "/players"
            elsif
                @errors = team.errors.full_messages
                erb :"/teams/signup"
            end
            else
            redirect "/signup"
        end
    end

    get '/all_teams' do
        @teams = Team.all 
        erb :"/teams/show"
    end

    get '/all_teams/:id' do
        @team = Team.find(params[:id])
        
        erb :"/teams/team"
    end

    get '/all_teams/:id/edit' do
        @team = Team.find(params[:id])
        @players = Player.all.select{|player| player.team_id == nil }
        erb :"/teams/edit"
    end

    patch '/all_teams/:id' do 
        team = Team.find_by(id:params[:id])
        #team = update(params[:team])
        if current_user.id = team.id
            existing_player_ids = params[:team][:team_player_ids] || []
            new_player_ids = params[:team][:free_agent_ids] || [] 
            team.player_ids =  existing_player_ids + new_player_ids
            #if there is params fa fa.ids means there are players checked to add
            #binding.pry
            # add_player_ids = params[:fa] && params[:fa][:fa_ids]
            # if add_player_ids 
            #     add_player_ids.each do |id|
            #         player = Player.find(f)
            #         team.players << player
            #     end
            # end
            # remove_player_ids = params[:fa] && params[:fa][:fa_ids]
            # if remove_player_ids 
            #     remove_player_ids.each do |id|
            #         player = Player.find(f)
            #         team.players << player
            #     end
            # end
            #if params[:fa][:fa_ids] && params[:fa][:fa_ids].each do |f|
                #player = Player.find(f)
                #team.players << player
            end
            team.update(params[:team])
            #binding.pry
            redirect '/players' #"/all_teams/#{team.id}"
    end

   


        
end