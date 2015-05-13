class ApplicationController < Sinatra::Base

  # set folder for templates to ../views, but make the path absolute
  set :views, File.expand_path('../../views', __FILE__)

  # don't enable logging when running tests
  get '/' do
  	'Hello World!'
  end
end