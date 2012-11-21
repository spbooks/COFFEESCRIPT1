game =
  init: ->
    if not gfx.init()
      alert "Could not set up game canvas!" 
      return # abort the game

    # Ready to play!
    gfx.clear()
    
    gfx.load ->
      c = gfx.ctx

      # gfx.drawSprite(0, 0, 50, 50)
      # gfx.drawSprite(0, 0, 74, 50, 1, 1, 2)

      rand = (max) -> Math.floor Math.random() * max

      makeANinja = () ->
        x: rand gfx.w
        y: rand gfx.h
      
      drawANinja = (n) -> gfx.drawSprite 0, 1, n.x, n.y
      
      ninjas = (makeANinja() for [0...20])
      
      # drawANinja n for n in ninjas
      
      leftNinjas = (n for n in ninjas when n.x < gfx.w / 2)
      # drawANinja n for n in leftNinjas
      
      level1 = """
        .............
        ...........*.
        ....@#@@@@#@.
        .....#....#..
        .....#....#..
        ..*..#...@@@.
        ..@@@@@...#..
        ...#......#..
        ...#......#..
        ...#......#..
        .OOOOOOOOOOOO
      """
      
      makeLevel = (ascii) ->
        # 1. Define the tile-to-symbol map
        tiles =
          "@": [4, 1]
          "O": [4, 0]
          "*": [5, 1]
          "#": [5, 0]
        
        # 2. Cut up the ASCII string into characters
        asciiMap = (row.split "" for row in ascii.split "\n")
        
        # 3. Map the characters to their tiles
        (for row in asciiMap
          for col in row
            tiles[col])
      
      # Create a map from the ascii
      level = makeLevel level1
      
      setInterval ->
        # run game things
        player.update()

        gfx.clear()
  
        # Draw the level
        for row, y in level
          for tile, x in row
            continue if not tile
            xPos = x * gfx.tileW
            yPos = y * gfx.tileH
            gfx.drawSprite tile[0], tile[1], xPos, yPos
            
        player.render(gfx)
      , 33      
    
# Start the game running
game.init()