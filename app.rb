require 'sinatra'

class AdvancedRubyTraining < Sinatra::Base
  set :views, Proc.new { File.join(root, "app/views") }

  get '/' do
    erb :index
  end

  post '/login' do
    "Hello World #{params['username']}"
  end
end
