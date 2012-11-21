sound =
  audio: {}
  list:
    "dig": "dig.wav"
    "fall": "falling.wav"
    "particle": "particle.wav"
    "dead": "dead.wav"
  init: ->
    @audio[name] =
    new Audio "resources/#{url}" for name, url of @list
  play: (name) ->
    @audio[name]?.currentTime = 0;
    @audio[name]?.play()

sound.init()

