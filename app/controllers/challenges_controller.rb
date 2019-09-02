class ChallengesController < ApplicationController
    
    get '/challenges' do 
        if logged_in? 
            @challenges = Challenge.all
            erb :'challenges/index'
        else
            redirect '/login'
        end
    end

    post 'challenges' do 
        if params[:content] != ""
            @challenge = Challenge.new(params)
            @challenge.user = current_user
            @challenge.save
            redirect "/challenges/#{@challenge.id}"
        else
            redirect "challenges/new"
    end
  end
end
