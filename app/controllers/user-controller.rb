require './app/application-controller'
require './app/models/user'

class UserController < ApplicationController
  get %r{/([\d]+)} do |id|
    @user = User.find(id)
    erb :user
  end

  get '/new' do
    erb :register
  end

  post '/new' do
    user = User.create(name: params['name'], password: params['password'])
    redirect to("/#{user.id}")
  end
end
