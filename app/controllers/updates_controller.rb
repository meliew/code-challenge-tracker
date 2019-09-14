class UpdatesController < ApplicationController

   get '/updates' do 
        if logged_in?
        @user = current_user 
        @challenges = @user.challenges 
        erb :'updates/show'
    end
   
   
    get '/updates/new' do
        if logged_in?
            erb :'updates/new'
        else
            erb :'/login'
        end
    end

    post '/updates/new/:id' do 
        @challenge = Challenge.find_by_id(params[:id])
        Update.create(log_date: params[:log_date], log_day params[:log_day], log: params[:log])
        redirect '/updates'
    end


end
