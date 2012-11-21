@game =
  dialog: null
  screen: null
  init: ->
    if not gfx.init()
      alert "Sorry, no canvas"
      return
    gfx.load ->
      game.reset()
  stop: -> @running = false
  start: -> @running = true
  
  reset: ->
    @dialog = null
    @screen = new TitleScreen()
    keys.reset()
    if not @running
      @start()
      @tick()

  tick: ->
    return if not @running
    @update()
    @render()
    setTimeout (=> @tick()), 33
    
  update: ->
    if @dialog?
      @dialog.update()
    else
      @screen.update()
    
  render: ->
    gfx.clear()
    @screen.render gfx
    @dialog.render gfx if @dialog
