class PracticeSessionsController < ApplicationController

    get '/practice-sessions/new' do
        erb :'practice_sessions/new'
    end

end