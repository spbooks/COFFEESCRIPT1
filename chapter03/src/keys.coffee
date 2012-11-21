keys =
  up: false,
  down: false,
  left: false,
  right: false,
  space: false,

  reset: ->
    @up = @down = @left = @right = @space = false

  trigger: (keyCode, isDown) ->
    switch keyCode
      when 37 then @left = isDown
      when 39 then @right = isDown
      when 38 then @up = isDown
      when 40 then @down = isDown
      when 32
        console.log "FIRE AWAY!" if isDown
        @space = isDown
  
document.addEventListener "keydown", (e) ->
  keys.trigger e.keyCode, true
,false

document.addEventListener "keyup", (e) ->
  keys.trigger e.keyCode, false
,false
