require 'sinatra/base'
require "sinatra/activerecord"

class User < ActiveRecord::Base
  validates_presence_of :username
end

class Myapp < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  set :database, {adapter: "sqlite3", database: "myapp.sqlite3"}

  get '/' do
    haml :index
  end

  post '/create' do
    if params[:username].empty? || params[:password].empty?
      "Username or password can't be empty"
    else
      User.create(username: params[:username], password: params[:password])
      "hello #{params[:username]}"
    end
  end

  get '/login' do
    haml :login
  end

  post '/session' do
    user = User.where(username: params[:username], password: params[:password]).first
    if user.nil?
      "User not exists"
    else
      "Welcome #{user.username}"
    end
  end

  run! if app_file == $0
end