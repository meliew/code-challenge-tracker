require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    register Sinatra::Flash
    set :session_secret, "secret"
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  not_found do
    erb :not_here
  end

  get "/" do
    erb :index
  end

  helpers do
    def logged_in?
     !!session[:user_id]
    end

    def current_user 
      @current_user ||=User.find_by(id: session[:user_id]) if session[:user_id]
    end
  end
end
