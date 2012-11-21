class WinDialog extends Dialog
  time: 100
  update: ->
    game.reset() if --@time == 0
            
  render: (gfx) ->
    c = gfx.ctx
    c.save()
    c.translate 100, 150
    c.fillStyle = "hsla(105, 40%, 50%, 0.8)"
    c.fillRect 0, 0, 350, 200

    c.fillStyle = "#e0e0e0"
    c.fillText "You WIN!!", 50, 100
    c.restore()

