class VideoGamesController < ApplicationController

    get '/games/new' do 
        erb :'/games/new'
    end

    post '/games' do 
        if !logged_in?
            redirect '/'
        end
        if params[:title] != ""
            @game = VideoGames.create(title: params[:title], user_id: current_user.id)
            redirect "/games/#{@game.id}"
        else
            redirect '/games/new'
        end


    end




end
