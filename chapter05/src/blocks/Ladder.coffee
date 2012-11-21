class Ladder extends Block
  climbable: true
  constructor: (@top) ->
    @frame = if top then 6 else 5
  render: (gfx, x, y) -> gfx.drawSprite @frame, 0, x, y