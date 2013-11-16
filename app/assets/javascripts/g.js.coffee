window.G ?= {}


G.init = () ->
  G.SetupTemplates()
  viewModel = G.CreateViewModel()
  G.ViewModel = viewModel
  ko.applyBindings(viewModel, $("#g")[0])
  G.Setup()

G.SetupTemplates = () ->
  $( "#tones" ).append('<div id="g">
  G <span data-bind="visible: playing">playing</span>
</div>')
 
G.CreateViewModel = () ->
  model = {}
  model.playing = ko.observable(false)
  model

G.Setup = () ->
  window.AudioContext = window.AudioContext or window.webkitAudioContext
  context = new AudioContext()
  Buffer = null
  bufferLoader = new BufferLoader(context, "/assets/g.wav", (buffer) ->
    Buffer = buffer
  )
  bufferLoader.load()

  $(window).on "G", ->
    G.ViewModel.playing(true)
    playSound context, Buffer, Buffer.duration
    console.log "G"
    setTimeout ->
      G.ViewModel.playing(false)
    , 200
    