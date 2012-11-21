class LevelDialog extends Dialog
  time: 50
  constructor: (@level) ->
  update: ->
    if --@time == 0
      game.dialog = null

  render: (gfx) ->
    c = gfx.ctx
    c.save()
    c.translate 100, 150
    c.fillStyle = "hsla(205, 40%, 50%, 0.8)"
    c.fillRect 0, 0, 350, 200

    c.fillStyle = "#e0e0e0"
    c.fillText "#{ @level }", 50, 100
    c.restore()   
