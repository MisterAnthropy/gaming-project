class UsersController < ApplicationController


    #render the login page 
    get '/login' do 
        erb :login
    end


    #receive the login form, find the user and log them in
    post '/login' do 
        @user = Users.find_by(username: params[:username])
         if @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect "users/#{@user.id}"
         else 
         end
    end

    #render the signup page
    get '/signup' do 
        erb :signup 
    end
    

    post '/users' do 

    end

    

    get '/users/:id' do 
        "users show.erb route"
    end


end
