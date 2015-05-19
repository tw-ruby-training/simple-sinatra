require './app/controllers/login-controller'
require './app/controllers/user-controller'
require './app/controllers/has-to-be-login-controller'

map('/')      { run LoginController }
map('/user')  { run UserController }
map('/secret')  { run HasToBeLoginController }
