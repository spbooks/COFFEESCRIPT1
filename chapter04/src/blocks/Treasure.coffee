class Treasure extends Block
  constructor: -> @yOff = Math.random() * Math.PI
  update: -> @yOff +=  Math.PI / 24
  render: (gfx, x, y) ->
    ySine = Math.floor Math.sin(@yOff) * 4
    gfx.drawSprite 5, 1, x, y + ySine