global.UserController = {}

UserController.show = (req, res) ->
  res.send "Respond with a resource"

module.exports.UserController = UserController

