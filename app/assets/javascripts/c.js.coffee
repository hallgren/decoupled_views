window.C ?= {}


C.init = () ->
  C.SetupTemplates()
  viewModel = C.CreateViewModel()
  C.ViewModel = viewModel
  ko.applyBindings(viewModel, $("#c")[0])
  C.Setup()

C.SetupTemplates = () ->
  $( "#tones" ).append('<div id="c">
  C <span data-bind="visible: playing">playing</span>
</div>') 
 
C.CreateViewModel = () ->
  model = {}
  model.playing = ko.observable(false)
  model

C.Setup = () ->
  window.AudioContext = window.AudioContext or window.webkitAudioContext
  context = new AudioContext()
  Buffer = null
  bufferLoader = new BufferLoader(context, "/assets/c.wav", (buffer) ->
    Buffer = buffer
  )
  bufferLoader.load()

  $(window).on "C", ->
    C.ViewModel.playing(true)
    playSound context, Buffer, Buffer.duration
    console.log "C"
    setTimeout ->
      C.ViewModel.playing(false)
    , 200
