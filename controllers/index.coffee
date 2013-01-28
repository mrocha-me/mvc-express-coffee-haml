global.MainController = {}

MainController.index = (req, res) ->
  res.render 'index', { title: 'Express' }

module.exports.MainController = MainController
