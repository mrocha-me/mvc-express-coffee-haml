require './controllers'
require './controllers/user'

module.exports = (app) ->
  app.get "/", MainController.index
  app.get "/users", UserController.show
