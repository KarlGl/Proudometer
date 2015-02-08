_ = require('lodash')

module.exports = (speedometer)->
  index: (er, res, json)->
    speedometer.animatedUpdate( _.last(json).proud, 1000)
  update: (er, res, json)->
    proud = json[0].proud
    speedometer.animatedUpdate(proud, 3000)
