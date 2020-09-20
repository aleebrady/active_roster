class SessionController < ApplicationController

    get '/login' do 
        erb :"session/login"
    end

    post '/login' do
        user = Team.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id 
            #binding.pry
            redirect "/players"
        else
            @errors = "Invalid Username and/or Password"
            erb :"/session/login"
            #redirect "/login"
        end
    end

    delete '/logout' do
        session.clear
        redirect "/"
    end

end