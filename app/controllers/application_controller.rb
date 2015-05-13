require 'sinatra/activerecord'

class User < ActiveRecord::Base
end

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  # set folder for templates to ../views, but make the path absolute
  set :views, File.expand_path('../../views', __FILE__)

  # don't enable logging when running tests
  get '/' do
  	@user = User.all.to_a
  	"User are #{@user.length}"
  end
end