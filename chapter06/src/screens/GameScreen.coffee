class GameScreen extends Screen
  levelNumber: 0

  constructor: ->
    @player = new Player()
    @startLevel()

  setPlayer: (x, y, level) ->
    # Set the player to the correct level position
    @player.level = level
    @player.x = x
    @player.y = y

  update: ->
    # Update level, player, and check collisions
    @level.update()
    @player.update()

  startLevel: ->
    @level = new Level levels[@levelNumber], @
    game.dialog = new LevelDialog(levels[@levelNumber].name)

  levelComplete: ->
    if ++@levelNumber >= levels.length
      game.win()
    else
      @startLevel()

  render: (gfx) ->
    gfx.ctx.save()

    gfx.ctx.scale 1.3, 1.3

    leftEdge = 210
    offx = if @player.x > leftEdge then -@player.x + leftEdge else 0
    gfx.ctx.translate offx, -@player.y + 130

    @level.render gfx
    @player.render gfx

    gfx.ctx.restore()

    backX = 1 - (@player.x / gfx.w) * 100
    backY = 1 - (@player.y / gfx.h) * 100
    gfx.ctx.canvas.style.backgroundPosition = "#{backX}px #{backY}px"
