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



end
