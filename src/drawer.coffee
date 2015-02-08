_ = require('lodash')

module.exports = (speedometer)->
  index: (er, res, json)->
    speedometer.animatedUpdate( _.last(json).proud, 1000)

    data = {
      name: 'proudness',
      values:
        json.map (proud)->
          x: new Date(proud.time)
          y: proud.proud
    };
    new LineChart(
      x_scale: d3.time.scale()
      y_scale: d3.scale.linear().domain([0,100])
      y_axis_text: 'Proudness'
    ).for([data]).plot();


  update: (er, res, json)->
    proud = json[0].proud
    speedometer.animatedUpdate(proud, 3000)
