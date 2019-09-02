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

    get '/login' do 
        if !logged_in?
        erb :'/users/login'
        else 
            redirect '/challenges/index'
        end
    end

    post '/login' do 
        @user = User.find_by(:username => params[:username])
        if @user && @user.authenticaate(params[:password])
            session[:user_id] = @user.id
            redirect '/challenges'
        else 
            redirect '/login'
        end 
    end 
    
    get '/logout' do 
        if logged_in? 
            session.destroy 
        end
            redirect '/login'
            


end
