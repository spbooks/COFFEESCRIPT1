class TitleScreen extends Screen
  min: 20

  update: ->
    return if @min-- > 0
    game.screen = new GameScreen() if keys.space

  render: (gfx) ->
    c = gfx.ctx
          
    gfx.clear()
    c.drawImage gfx.title, 180, 10
    # Some instructions
    c.fillStyle = "#e0e0e0"
    c.font = "14pt monospace"
    gfx.drawSprite 5, 1, 480, 180
    c.fillText "Collect all \"Pig’s Boffin\" particles.", 50, 210
    c.fillText "Press space to start...", 50, 240 
