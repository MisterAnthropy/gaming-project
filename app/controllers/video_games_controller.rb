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
            @game = VideoGame.create(title: params[:title], user_id: current_user.id)
            redirect "/games/#{@game.id}"
        else
            redirect '/games/new'
        end
    end

    get '/games/:id' do
        @game = VideoGame.find_by(id: params[:id]) 
        erb :'/games/show'
    end


    get '/games/:id/edit' do 
        @game = VideoGame.find_by(id: params[:id])
        if logged_in?
            if authorized?(@game)
            erb :'/games/edit'
            #problem code below
            else 
                redirect "/users/#{current_user.id}"
            end
        else 
            redirect '/'
        end

    end

    post '/games/:id' do
        @game = VideoGame.find(params[:id])
        if logged_in?
            if @game.user == current_user 
            @game.update(title: params[:title])
            redirect "/games/#{@game.id}"
            else
                redirect "users/#{current_user.id}"
            end
        else
            redirect '/'
        end

    end

    delete '/games/:id' do 


    end







end
