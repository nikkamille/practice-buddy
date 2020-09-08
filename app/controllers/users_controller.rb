class UsersController < ApplicationController

    get '/signup' do
        erb :'users/signup'
    end

    post '/signup' do
        if params[:username] == "" || params[:email] == "" || params[:password] == ""
            redirect '/failure'
        else
            @user = User.create(params)
            session[:user_id] = @user.id
            redirect '/dashboard'
        end
    end

    get '/dashboard' do
        @user = User.find(session[:user_id])
        erb :'users/dashboard'
    end

    get '/login' do
        erb :'users/login'
    end

    post '/login' do
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect '/dashboard'
        else
            @failed_login = true
            if !@user
                @user = User.new
            end
            erb :'users/login'
        end
    end

    get '/logout' do
        session.clear
        redirect '/'
    end

    get '/failure' do
        erb :'users/failure'
    end

end