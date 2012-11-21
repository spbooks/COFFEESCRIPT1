# alert "Game loaded!"

game =
  init: ->
    if not gfx.init()
      alert "Could not set up game canvas!" 
      return # abort the game

    # Ready to play!
    gfx.clear()
    
    gfx.load ->
      c = gfx.ctx
      
      # c.drawImage gfx.sprites, 10, 20
      
      # Our Professor's first solo performance on screen
      # gfx.drawSprite 0, 0, 100, 50
      
      # Random Map
      rand = (max) -> Math.floor Math.random() * max
      for y in [0..19]
        for x in [0..23]
          col = rand 7
          row = rand 2
          gfx.drawSprite col, row, x * 24, y * 24
    
# Start the game running
game.init()
    
###
# Title screen
c = gfx.ctx

# Orange rectangle with a dark-gray border
c.fillStyle = "orange"
c.fillRect 10, 10, 300, 80
c.strokeStyle = "#3f3f3f"
c.strokeRect 10, 10, 300, 80

# Professor Digman-Rünner text
c.fillStyle = "#202020"
c.font = "14pt monospace"
c.fillText "Professor Digman-Rünner", 30, 55
###
