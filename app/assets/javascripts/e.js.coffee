window.E ?= {}


E.init = () ->
  E.SetupTemplates()
  viewModel = E.CreateViewModel()
  E.ViewModel = viewModel
  ko.applyBindings(viewModel, $("#e")[0])
  E.Setup()

E.SetupTemplates = () ->
  $( "#tones" ).append('<div id="e">
  E <span data-bind="visible: playing">playing</span>
</div>') 
 
E.CreateViewModel = () ->
  model = {}
  model.playing = ko.observable(false)
  model

E.Setup = () ->
  window.AudioContext = window.AudioContext or window.webkitAudioContext
  context = new AudioContext()
  Buffer = null
  bufferLoader = new BufferLoader(context, "/assets/e.wav", (buffer) ->
    Buffer = buffer
  )
  bufferLoader.load()

  $(window).on "E", ->
    E.ViewModel.playing(true)
    playSound context, Buffer, Buffer.duration
    console.log "E"
    setTimeout ->
      E.ViewModel.playing(false)
    , 200