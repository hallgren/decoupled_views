window.F ?= {}


F.init = () ->
  F.SetupTemplates()
  viewModel = F.CreateViewModel()
  F.ViewModel = viewModel
  ko.applyBindings(viewModel, $("#f")[0])
  F.Setup()

F.SetupTemplates = () ->
  $( "#tones" ).append('<div id="f">
  F <span data-bind="visible: playing">playing</span>
</div>') 

F.CreateViewModel = () ->
  model = {}
  model.playing = ko.observable(false)
  model

F.Setup = () ->
  window.AudioContext = window.AudioContext or window.webkitAudioContext
  context = new AudioContext()
  Buffer = null
  bufferLoader = new BufferLoader(context, "/assets/f.wav", (buffer) ->
    Buffer = buffer
  )
  bufferLoader.load()

  $(window).on "F", ->
    F.ViewModel.playing(true)
    playSound context, Buffer, Buffer.duration
    console.log "F"
    setTimeout ->
      F.ViewModel.playing(false)
    , 200