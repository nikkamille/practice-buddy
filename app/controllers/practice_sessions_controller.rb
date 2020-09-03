class PracticeSessionsController < ApplicationController

    get '/practice-sessions' do
        if logged_in?
            @practice_sessions = PracticeSession.all
            erb :'practice_sessions/index'
        else
            redirect '/login'
        end
    end


end