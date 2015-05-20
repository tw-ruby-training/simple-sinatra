require 'sinatra'
require 'sinatra/sequel'
require 'sinatra/base'

require_relative '../../lib/database_helper'
require_relative '../models/user'


class LoginController < Sinatra::Base
  set :views, __dir__+'/../views/'

  get '/' do
    redirect '/signup'
  end

  get '/signup' do
    haml :index
  end

  post '/signup' do
    User.create({:email => params[:email], :password => params[:password]})
    haml :welcome
  end

  get '/login' do
    haml :login
  end

  post '/login' do
    user = User.find({:email => params[:email]})
    if(user.nil?)
      redirect '/signup'
    end

    haml :welcome
  end

end

