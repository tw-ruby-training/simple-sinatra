require 'sinatra'
require 'json'

Users = {
  'livia' => 'nopassword',
  'livia2' =>  'password'
}

get '/login' do
  erb :index
end

post '/login' do
  @username = params['username']

  if Users[@username] == params['password']
    @username = params['username']
    erb :timeline
  else
    @error = 'Login Failed, please check your username or password.'
    erb :index
  end
end

post '/register' do
  Users[params[:username]] = params[:password]
  @success = 'Sign Up success, please use your account to login.'
  erb :index
end
