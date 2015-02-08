request = require('request')

URL = "http://163.47.16.20:2081"

document.addEventListener "DOMContentLoaded", ()->
  document.removeEventListener("DOMContentLoaded", arguments.callee, false);
  speedometer = new Speedometer('speedometer', {theme: 'default'});
  speedometer.draw()
  drawer = require('./drawer')(speedometer)

  request({
    url: URL,
    json: true
  }, drawer.index)

  form=document.getElementById("form")
  form.addEventListener 'submit', (event)->
    event.preventDefault()
    request({
      url: URL,
      method: "POST",
      json: true,
      body: {p: parseInt(event.currentTarget[0].value)}
    }, drawer.update)

, false
