class UsersController < ApplicationController


    get '/login' do 
        erb :login
    end


    post '/login' do 
        @user = User.find_by(username: params[:username])
         if @user != nil && @user.authenticate(params[:password]) 
            session[:user_id] = @user.id
            puts session
            redirect "/users/#{@user.id}"
         else 
            redirect '/login'

         end
    end

    get '/signup' do 
        erb :signup 
    end
    

    post '/users' do 
        if 
            params[:username] != "" && params[:password] != ""
            @user = User.create(params)
            session[:user_id] = @user.id
            redirect "/users/#{@user.id}"
        else
            redirect '/signup'
        end


    end



    get '/users/:id' do 
       @user = User.find_by(id: params[:id])
        
        redirect "/games"
    end

    get '/logout' do 
        session.clear
        redirect '/'
    end



end
