class Gravel extends Block
  solid: true
  digTime: 100

  update: (x, y, level) ->
    if --@digTime < 0
      level.removeBlock x, y, @

  render: (gfx, x, y) ->
    oldAlpha = gfx.ctx.globalAlpha
    gfx.ctx.globalAlpha = @digTime / 50
    gfx.drawSprite 4, 2, x, y
    gfx.ctx.globalAlpha = oldAlpha

