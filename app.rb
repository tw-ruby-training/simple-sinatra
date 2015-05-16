require 'sinatra/base'
require "sinatra/activerecord"

class Myapp < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  set :database, {adapter: "sqlite3", database: "myapp.sqlite3"}

  get '/' do
    "hello"
  end
  
  run! if app_file == $0
end