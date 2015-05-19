require 'sinatra/base'
require "sinatra/activerecord"

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  set :views, Proc.new { File.join(root, "./views") }
  set :database, {adapter: "sqlite3", database: "art.sqlite3"}
end
