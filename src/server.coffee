bodyParser = require('body-parser')

module.exports = (app, env)->
  app.use(require('connect-livereload')())
  app.use(bodyParser.json())
  app.use(bodyParser.urlencoded({extended: true}))

  # must be before wildcard route
  app.get '/main.js', (req, res)->
    res.setHeader('content-type', 'application/javascript');
    res.sendFile('dist/main.js', {root: '.'})


  app.get '/*', (req, res)->
    if (path = req.params[0])
      res.sendFile(path, {root: './src/canvas-speedometer'})
    else
      res.sendFile('src/canvas-speedometer/speedometer.html', {root: '.'})

  server = app.listen 8080, ->
    host = server.address().address
    port = server.address().port
    console.log('Example app listening at http://%s:%s', host, port)
