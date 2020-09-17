class SessionController < ApplicationController

    get '/login' do 
        erb :"session/login"
    end

    post '/login' do
        user = Team.find_by(username: params[:username])
        #binding.pry
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id 
            redirect "/players"
        else
            #@errors = user.errors.full_messages
            redirect "/login"
        end
    end

    delete '/logout' do
        session.clear
        redirect "/"
    end

end