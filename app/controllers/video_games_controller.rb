class VideoGamesController < ApplicationController

    get '/games' do 
        @games = VideoGame.all 
        erb :'/games/index'
    end

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

    get '/games/:id' do
        @game = VideoGames.find(params[:id]) 
        erb :'/games/show'
    end


    get '/games/:id/edit' do 
        @game = VideoGames.find_by(id: params[:id])
        if logged_in?
            if @game.users == current_user
            erb :'/games/edit'
            #problem code below
         
            end
        else 
            redirect '/'
        end

    end

    patch '/games/:id' do
        @game = VideoGames.find(params[:id])
        if logged_in?
            @game.update(title: params[:title])
            redirect "/games/#{@game.id}"
        else
            redirect '/'
        end

    end






end
