require 'sinatra'
require 'sinatra/sequel'
require 'sinatra/base'

require_relative '../../lib/database_helper'
require_relative '../models/user'


class LoginController < Sinatra::Base
  set :views, __dir__+'/../views/'

  get '/' do
    redirect '/login'
  end

  get '/login' do
    haml :index
  end

  post '/login' do
    User.create({:email => params[:email], :password => params[:password]})
    haml :login
  end

end

