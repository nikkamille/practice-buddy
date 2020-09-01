class User < ActiveRecord::Base
    has_many :practice_sessions
end