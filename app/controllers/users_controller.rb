class UsersController < ApplicationController


    #render the login page 
    get '/login' do 
        erb :login
    end


    #receive the login form, find the user and log them in
    post '/login' do 

    end



    #render the signup page
    get '/signup' do 
        
    end


end
