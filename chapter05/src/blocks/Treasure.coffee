class Treasure extends Block
  touchable: true
  collected: false
  constructor: -> @yOff = Math.random() * Math.PI
  touch: (entity) -> 
    @collected = true if entity.constructor is Player
  update: (x, y, level) ->
    @yOff +=  Math.PI / 24
    if @collected
      level.removeBlock x, y, @
  render: (gfx, x, y) ->
    ySine = Math.floor Math.sin(@yOff) * 4
    gfx.drawSprite 5, 1, x, y + ySine