require 'sinatra/base'

class UserController < Sinatra::Base
  get '/users' do
    haml :index
  end

  post '/users' do
    haml :login
  end

  run! if app_file == $0
end