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

    get '/practice-sessions/:id/edit' do
        @practice_session = PracticeSession.find_by_id(params[:id])
        if @practice_session.user == current_user
            erb :'practice_sessions/edit'
        else
            redirect '/dashboard'
        end
    end

    patch '/practice-sessions/:id' do
        @practice_session = PracticeSession.find_by_id(params[:id])
        @practice_session.date = params[:date]
        @practice_session.practice_item = params[:practice_item]
        @practice_session.duration = params[:duration]
        @practice_session.notes = params[:notes]
        if @practice_session.user == current_user
            if @practice_session.save
                redirect "/practice-sessions/#{@practice_session.id}"
            else
                erb :'practice_sessions/edit'
            end
        else
            redirect '/dashboard'
        end
    end

    delete '/practice-sessions/:id' do
        @practice_session = PracticeSession.find_by_id(params[:id])
        if @practice_session.user == current_user
            @practice_session.delete
        end
        redirect '/dashboard'
    end

end