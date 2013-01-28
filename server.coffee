express = require 'express'
http = require 'http'
path = require 'path'

app = express()

app.engine 'hamlc', require('haml-coffee').__express

app.configure( ->
  app.set 'port', process.env.PORT || 3000
  app.set 'views', __dirname + '/views'
  app.set 'view engine', 'hamlc'
  app.use express.favicon()
  app.use express.logger 'dev'
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use app.router
  app.use express.static(path.join(__dirname, '/public'))
  true
)

app.configure 'development', ->
  app.use express.errorHandler()
  true

require('./routes')(app)

http.createServer(app).listen(app.get('port'), ->
  console.log "Express server listening on port " + app.get 'port'
)
