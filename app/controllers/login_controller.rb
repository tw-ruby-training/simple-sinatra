require 'sinatra/base'
require_relative '../../lib/database_helper'

class LoginController < Sinatra::Base
  set :views, __dir__+'/../views/'
  set :database, DatabaseHelper.database_uri

  get '/' do
    redirect '/login'
  end

  get '/login' do
    haml :index
  end

  post '/login' do
    haml :login
  end

end