require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "video_game_collection"
  end

  get "/" do
    if logged_in?
      redirect "/games"
    else
      erb :welcome
    end
  end

  helpers do 

    def logged_in?

      !!session[:user_id]
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

    def authorized?(game)
      game.user == current_user 
    end



  end


end
