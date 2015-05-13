require 'sinatra/activerecord'

class User < ActiveRecord::Base
end

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  # set folder for templates to ../views, but make the path absolute
  set :views, File.expand_path('../../views', __FILE__)

  # don't enable logging when running tests
  get '/' do
  	haml :index, locals: { users: User.all }
  end

  get '/new' do
  	haml :new
  end

  get '/hello/:name' do
  	"Hello User #{params[:name]}"
  end

  post '/register' do
  	User.create(username: params[:username], password: params[:password])
  	redirect "/hello/#{params[:username]}"
  end

  post '/sessions' do
  	user = User.where(username: params[:username], password: params[:password]).first
  	if user.nil?
  		haml :index, locals: {message: 'wrong username password'}
  	else
  		redirect "/hello/#{params[:username]}"
  	end
  end
end