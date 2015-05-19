require 'sinatra/base'

class LoginController < Sinatra::Base
  get '/' do
    redirect '/login'
  end

  get '/login' do
    haml :index
  end

  post '/login' do
    haml :login
  end

  run! if app_file == $0
end