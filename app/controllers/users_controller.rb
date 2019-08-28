class UsersController < ApplicationController

    #sign-up 
    #form - with fields for username, email, password 
    #log-in 
    #create challenge 
    #edit challenge 
    #log-out 

    get '/signup' do 
        erb :'/users/signup'
    end

    post '/signup' do 
        if params[:username] != "" && params[:email] != "" && params[:passwprd] != ""
            @user = User.new(params)
            @user.save
            session[:user_id] = @user.id 
            redirect '/challenges'
        else
            redirect '/signup'
        end
    end




end
