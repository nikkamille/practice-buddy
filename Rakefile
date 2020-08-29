ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'

task :environment do
    require_relative './config/environment'
end

desc 'drop into the Pry console'
task :console => :environment do
  Pry.start
end