require 'sinatra'
require 'sinatra/activerecord'

require './models/user'
require './lib/helpers/user_auth'

enable :sessions
helpers UserAuth

get '/' do
	erb :index, layout: :layout 
end

post '/login' do
	if auth(params['username'], params['password'])
	  @success_message = 'Logged in successfully'
	else
	  @error_message = 'Logged in failed'
	end
	erb :index, layout: :layout
end

get '/register' do
	erb :register, layout: :layout
end

post '/register' do
	if invalid_params?(params['username']) || invalid_params?(params['password'])
      @error_message = 'username and password can not be empty'
	  erb :register, layout: :layout
	else
	  @user = User.create(username: params['username'], password: params['password'])
	  erb :index, layout: :layout
	end
end
