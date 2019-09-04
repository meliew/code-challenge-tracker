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

    get '/challenges/new' do 
        if !logged_in?
            redirect '/login'
        else
            erb :'challenges/new'
        end
    end

    get '/challenges/:id' do 
        if logged_in?
            @challenge = Challenge.find_by_id(params[:id])
            erb :'/challenges/show'
        else
            redirect '/login'
        end
    end

    get '/challenges/:id/edit' do 
        if logged_in?
            @challenge = Challenge.find_by_id(params[:id])
            if @challenge && @challenge.user == current_user
                erb :'challenges/edit'
            else
                redirect '/challenges'
            end
        else
            redirect '/login'
        end
    end

        patch '/challenges/:id' do 
            @challenge = Challenge.find_by_id(params[:id])
            if params[:content] !+ ""
                @challenge.update(content: params[:content])
                redirect "/challenges/#{@challenge.id}"
            else
                redirect "challenges/#{@challenge.id}/edit"
            end
        end

        delete "challenges/:id/delete" do
            if logged_in?
                @challenge = Challenge.find_by_id(params[:id])
                if @challenge && @challenge.user == current_user
                    @challenge.delete
                    redirect "/challenges"
                end
            else 
                redirect "/login"
            end
        end

end
