class Dirt extends Block
  solid: true
  render: (gfx, x, y) ->
    oldAlpha = gfx.ctx.globalAlpha
    gfx.ctx.globalAlpha = 1 - @digTime / 80
    gfx.drawSprite 4, 1, x, y
    gfx.ctx.globalAlpha = oldAlpha
  digIt: ->
    @digTime = 80
    @solid = false
  update: ->
    @solid = true if --@digTime is 50 
