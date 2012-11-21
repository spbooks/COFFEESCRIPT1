ctx = document
  .getElementById("game")
  .getContext("2d")

ctx.fillStyle = "#000"
ctx.fillRect 0, 0, ctx.canvas.width, ctx.canvas.height

noise = ->
  for x in [0..20]
    for y in [0..10]
      color = Math.floor(Math.random() * 360)
      ctx.fillStyle = "hsl(#{color}, 60%, 50%)"
      ctx.fillRect x * 15, y * 15, 14, 14

setInterval noise, 100