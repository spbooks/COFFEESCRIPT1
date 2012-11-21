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
          when "#" then new Ladder()
          when "-" then new Ladder true # Top of the ladder
          else new Block()
    
    # 4. Set the level height and width
    @h = @map.length
    @w = @map[0].length
    
  addNinja: (x, y) ->
    xPos = x  * gfx.tileW
    yPos = y  * gfx.tileH
    ninja = new Ninja @, xPos, yPos, @game.player
    @ninjas.push ninja
    
  addPlayer: (x, y) ->
    @game.setPlayer x * gfx.tileW, y * gfx.tileH, @
    
  removeBlock: (x, y, block) ->
    @map[y][x] = new Block()
    if block.constructor is Treasure
      if --@treasures == 0
        alert "Level Complete!"
        game.reset()

  getBlockIndex: (x, y) -> [
    Math.floor x / gfx.tileW
    Math.floor y / gfx.tileH
  ]
      
  getBlockEdge: (position, forVertical = false) ->
    snapTo = if not forVertical then gfx.tileW else gfx.tileH
    utils.snap position, snapTo
  
  getBlock: (x, y) -> 
    [xBlock, yBlock] = @getBlockIndex x, y
    @map[yBlock]?[xBlock] or new Rock()

  getBlocks: (coords...) -> @getBlock x, y for [x, y] in coords
  
  update: ->
    # Update the level blocks
    for row, y in @map
      for block, x in row
        block.update  x, y, @
    ninjas.update() for ninjas in @ninjas
        
    @checkCollision @game.player, ninjas for ninjas in @ninjas
    
  checkCollision: (p, b) ->
    if p.x + p.w >= b.x and
    p.x <= b.x + b.w and
    p.y + p.h >= b.y and
    p.y <= b.y + b.h
      alert "You are dead."
      game.reset()
    
  render: (gfx) ->
    # Render the level blocks
    for row, y in @map
      for block, x in row
        block.render gfx, x  * gfx.tileW, y  * gfx.tileH
    ninjas.render gfx for ninjas in @ninjas

  digAt: (dir, x, y) ->
    [xb, yb] = @getBlockIndex x, y

    xb = xb + if dir == "RIGHT" then 1 else -1
    return if yb + 1 > @h or xb < 0 or xb > @w - 1
    block = @map[yb + 1][xb]
          
    # Dig the block!
    block.digIt() if block.digIt?

    # Building
    @map[yb + 1][xb] = new Gravel() if block.constructor is Block
