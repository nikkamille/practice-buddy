class UsersController < ApplicationController

    get '/signup' do
        erb :'users/signup'
    end

    post '/signup' do
        @user = User.create(params)
        session[:user_id] = @user.id
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
            redirect '/login'
        end
    end

    get '/dashboard' do
        @user = User.find(session[:user_id])
        @practice_sessions = PracticeSession.all
        erb :'users/dashboard'
    end

end