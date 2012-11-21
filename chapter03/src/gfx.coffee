gfx =
  tileW: 24
  tileH: 24
  init: ->
    canvas = document.querySelector "#game"
    @ctx = canvas?.getContext? "2d"
    return false if not @ctx
    @w = canvas.width
    @h = canvas.height
    true
  clear: -> @ctx.clearRect 0, 0, @w, @h
  load: (onload) ->
    @sprites = new Image()
    @sprites.src = "resources/sprites.png"
    @sprites.onload = -> onload()
  drawSprite: (col, row, x, y, w = 1, h = 1, scale = 1) ->
    w *= @tileW
    h *= @tileH
    @ctx.drawImage @sprites, 
      col * w, row * h, w, h,
      x, y, w * scale, h * scale