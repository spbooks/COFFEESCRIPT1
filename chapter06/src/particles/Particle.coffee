digParticles =
  life: 20
  num: 6
  size: [6, 4]
  xStart: [-2, 8]
  yStart: [-5, 0]
  xVelocity: [-1, 0]
  yVelocity: [-4, -1]
  acc: [0, 0.3]
  col:
    h: 20
    s: 60
    l: 40            

class Particle
  constructor: (x, y, @opt) ->
    @a = 0.5
    @x = x + utils.rand @opt.xStart[0], @opt.xStart[1]
    @y = y + utils.rand @opt.yStart[0], @opt.yStart[1]
    @xVelocity = utils.rand @opt.xVelocity[0], @opt.xVelocity[1]
    @yVelocity = utils.rand @opt.yVelocity[0], @opt.yVelocity[1]
  update: ->
    @a -= 0.01
    @x += @xVelocity
    @y += @yVelocity
    @xVelocity += @opt.acc[0]
    @yVelocity += @opt.acc[1]
  render: (gfx) ->
    gfx.ctx.fillStyle = "hsla(#{@opt.col.h}, #{@opt.col.s}%, #{@opt.col.l}%, #{@a})"
    gfx.ctx.fillRect Math.floor(@x), Math.floor(@y), @opt.size[0], @opt.size[1]

class Particles
  constructor: (x, y, @opt = digParticles) ->
    @life = @opt.life
    @ps = (new Particle(x, y, @opt) for [0..@opt.num])
    
  update: ->
    p.update() for p in @ps
    @life-- > 0

  render: (gfx) -> p.render gfx for p in @ps


