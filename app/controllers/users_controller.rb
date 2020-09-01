class UsersController < ApplicationController

    get '/signup' do
        erb :'users/signup'
    end

    post '/signup' do
        @user = User.create(params)
        erb :'users/dashboard'
    end

end