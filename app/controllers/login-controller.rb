require './app/application-controller'
require './app/models/user'

class LoginController < ApplicationController
  get %r{[/|/login]} do
    erb :login
  end

  post '/login' do
    user = User.find_by name: params['name'], password: params['password']
    redirect to("/user/#{user.id}") if user
    erb :login
  end
end
