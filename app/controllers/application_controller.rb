require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "video_game_collection"
  end

  get "/" do
    erb :welcome
  end

  helpers do 

    def logged_in?

      !!current_user
    end

    def current_user
      @current_user ||= Users.find_by(id: session[:user_id])
    end

  end


end
