window.G ?= {}


G.InitialLoader = init: (G) ->
  G.SetupTemplates()
  viewModel = G.CreateViewModel()
  G.ViewModel = viewModel
  ko.applyBindings(viewModel, $(dom_id_to_bind_to)[0])
  G.Setup()

G.SetupTemplates = () ->
  $( "body" ).append('<div id="morgan" style="display:none;" data-bind="visible: play">
  <label data-bind="text: name"></label>
  <button data-bind="click: play">play</button>
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
    