class UsersController < ApplicationController

    get '/signup' do 
        if !logged_in?
        erb :'/users/signup'
        else
            redirect "/challenges"
        end
    end

    post '/signup' do 
        if params[:username] != "" && params[:email] != "" && params[:password] != ""
            @user = User.new(params)
            @user.save
            if @user.valid?
                session[:user_id] = @user.id 
                redirect '/challenges'
            else
                flash[:error] = @user.errors.full_messages.to_sentence
                redirect '/signup'
            end
        else
            redirect '/signup'
        end
    end

    get '/login' do 
        if !logged_in?
        erb :'/users/login'
        else 
            redirect '/challenges'
        end
    end

    post '/login' do 
        @user = User.find_by(:username => params[:username])
        if @user && @user.authenticate(params[:password])
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
            


end
