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
        
end