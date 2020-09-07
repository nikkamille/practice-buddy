class PracticeSessionsController < ApplicationController

    get '/practice-sessions/new' do
        erb :'practice_sessions/new'
    end

    post '/practice-sessions/' do
        @practice_session = current_user.practice_sessions.build(params)
        if @practice_session.save
            redirect to "/practice-sessions/#{@practice_session.id}"
        else
            erb :'practice_sessions/new'
        end
    end

    get '/practice-sessions' do
        erb :'practice_sessions/index'
    end

    get '/practice-sessions/:id' do
        @practice_session = PracticeSession.find_by_id(params[:id])
        erb :show
    end

end