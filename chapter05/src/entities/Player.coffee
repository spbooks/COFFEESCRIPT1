class Player extends Entity
  constructor: ->
    super
    @dir = "RIGHT"  
  update: ->
    xo = yo = 0

    if not @falling
      if keys.left
        xo -= @speed
        @dir = "LEFT"

      if keys.right
        xo += @speed
        @dir = "RIGHT"

    yo += @speed if keys.down and @onLadder
    yo -= @speed if keys.up and @onLadder and not @onTopOfLadder

    @dig() if keys.space

    @move xo, yo
  render: (gfx) ->
    gfx.drawSprite 0, 0, @x, @y

  dig: ->
    return if utils.now() - @lastDig < (6 * 1000) # 6 seconds

    @level.digAt @dir, @x, @y
    @lastDig = utils.now()
