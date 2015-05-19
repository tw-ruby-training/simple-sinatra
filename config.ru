require './app/controllers/login-controller'
require './app/controllers/user-controller'

map('/')      { run LoginController }
map('/user')  { run UserController }
