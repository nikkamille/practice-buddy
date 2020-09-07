class PracticeSessionsController < ApplicationController

    get '/practice-sessions/new' do
        erb :'practice_sessions/new'
    end

    post '/practice-sessions' do
        @practice_session = current_user.practice_sessions.build(params)
        # redirect '/dashboard'
        if @practice_session.save
            redirect "/practice-sessions/#{@practice_session.id}"
        else
            erb :'practice_sessions/new'
        end
    end

    get '/practice-sessions' do
        if logged_in?
            @practice_sessions = PracticeSession.all
            erb :'practice_sessions/index'
        else
            redirect '/login'
        end 
    end

    get '/practice-sessions/:id' do
        @practice_session = PracticeSession.find_by_id(params[:id])
        erb :'practice_sessions/show'
    end

end