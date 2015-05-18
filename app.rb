require 'sinatra'
require "sinatra/activerecord"
require './app/models/user'

class AdvancedRubyTraining < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  set :views, Proc.new { File.join(root, "app/views") }
  set :database, {adapter: "sqlite3", database: "art.sqlite3"}

  get '/home/:id' do
    @user = User.find(params['id'])
    erb :home
  end

  get '/' do
    erb :index
  end

  post '/login' do
    user = User.find_by name: params['name'], password: params['password']
    redirect to("/home/#{user.id}") if user
    erb :index
  end

  get '/register' do
    erb :register
  end

  post '/register' do
    user = User.create(name: params['name'], password: params['password'])
    redirect to("/home/#{user.id}")
  end
end
