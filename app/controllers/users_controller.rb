class UsersController < ApplicationController


    #render the login page 
    get '/login' do 
        erb :login
    end


    #receive the login form, find the user and log them in
    post '/login' do 
        @user = User.find_by(username: params[:username])
         if @user.authenticate(params[:password])
            session[:user_id] = @user.id
            puts session
            redirect "/users/#{@user.id}"
         else 
            redirect '/login'

         end
    end

    #render the signup page
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
            #invalid input
            redirect '/signup'
        end


    end



    get '/users/:id' do 
        @user = User.find_by(id: params[:id])
        
        erb :'/users/show'
    end

    get '/logout' do 
        session.clear
        redirect '/'
    end



end
