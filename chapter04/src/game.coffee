@game =
  init: ->
    if not gfx.init()
      alert "Sorry, no canvas"
      return
    gfx.load ->
      game.reset()
  stop: -> @running = false
  start: -> @running = true
  
  reset: ->
    @player = new Player
    @level = new Level levels[0], @
    keys.reset()
    if not @running
      @start()
      @tick()
    
  setPlayer: (x, y, level) ->
    @player.level = level
    @player.x = x
    @player.y = y 

  tick: ->
    return if not @running
    gfx.clear()
    @update()
    @render()
    setTimeout (-> game.tick()), 33
    
  update: ->
    @level.update()
    @player.update()
    
  render: ->
    @level.render gfx
    @player.render gfx
