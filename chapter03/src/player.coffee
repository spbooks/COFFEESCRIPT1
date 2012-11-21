player =
  x: gfx.tileW * 3
  y: gfx.tileH * 5
  speed: 4
  update: ->
    @x -= @speed if keys.left
    @x += @speed if keys.right
    @y += @speed if keys.down
    @y -= @speed if keys.up
  render: (gfx) -> gfx.drawSprite 0, 0, @x, @y
