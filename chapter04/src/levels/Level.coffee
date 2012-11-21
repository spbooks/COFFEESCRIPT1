class Level
  w: 0
  h: 0
  treasures: 0
  ninjas: []
  constructor: (level, @game) -> @load level
  load: (level) ->
    # 1. Clear level items
    @ninjas = []
    @treasures = 0
    
    # 2. Parse the level string into a map
    asciiMap = (row.split "" for row in level.data.split "\n")

    # 3. Loop over the map and create the blocks
    @map = for row, y in asciiMap
      for col, x in row
        switch col
          when "@" then new Dirt()
          when "O" then new Rock()
          when "P"
            @addPlayer x, y
            new Block()
          when "X"
            @addNinja x, y
            new Block()
          when "*"
            @treasures++
            new Treasure()
          else new Block()
    
    # 4. Set the level height and width
    @h = @map.length
    @w = @map[0].length
  addNinja: (x, y) ->
    xPos = x  * gfx.tileW
    yPos = y  * gfx.tileH
    ninja = new Ninja @, xPos, yPos
    @ninjas.push ninja
  addPlayer: (x, y) ->
    @game.setPlayer x * gfx.tileW, y * gfx.tileH, @  
  update: ->
    # Update the level blocks
    for row in @map
      for block in row
        block.update()
    ninjas.update() for ninjas in @ninjas
  render: (gfx) ->
    # Render the level blocks
    for row, y in @map
      for block, x in row
        block.render gfx, x  * gfx.tileW, y  * gfx.tileH
    ninjas.render gfx for ninjas in @ninjas
