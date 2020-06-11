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
        set_game
        erb :'/games/show'
    end


    get '/games/:id/edit' do 
        set_game
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
        set_game
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
        set_game
        if authorized?(@game)
            @game.destroy
            redirect '/games'
        else    
            redirect '/games'
        end

    end

    def set_game
        @game = VideoGame.find_by(id: params[:id])
    end

end
