require './app/application-controller'
require './app/models/user'

class HasToBeLoginController < ApplicationController
  before do
    redirect to('../login') unless session[:user_name]
  end

  get '/' do
    erb :secret
  end
end
