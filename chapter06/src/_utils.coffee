utils = 
  counter: (max, speed = 100) -> Math.floor @now() / speed % max
  now: -> new Date().getTime()
  snap: (value, snapSize) -> Math.floor(value / snapSize) * snapSize
  rand: (min, max) -> 
    if not max?
      max = min
      min = 0
    range = max - min
    Math.floor (Math.random() * range) + min
