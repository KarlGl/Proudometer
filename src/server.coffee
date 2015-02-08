bodyParser = require('body-parser')

module.exports = (app, env)->
  app.use(require('connect-livereload')())
  app.use(bodyParser.json())
  app.use(bodyParser.urlencoded({extended: true}))

  app.get('/main.js', (req, res)->

    res.setHeader('content-type', 'application/javascript');
    res.sendFile('dist/main.js', {root: '.'})
  )

  app.get('/', (req, res)->
    console.log("GET INDEX")
    res.send('<script type="text/javascript" src="main.js"></script>')
  )

  server = app.listen(8080, ->
    host = server.address().address
    port = server.address().port
    console.log('Example app listening at http://%s:%s', host, port)
  )
