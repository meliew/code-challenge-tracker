class ChallengesController < ApplicationController
    
    get '/challenges' do 
        if logged_in? 
            @challenges = Challenge.all
            erb :'challenges/index'
        else
            redirect '/login'
        end
    end
end
