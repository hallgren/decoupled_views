window.D ?= {}


D.init = () ->
  D.SetupTemplates()
  viewModel = D.CreateViewModel()
  D.ViewModel = viewModel
  ko.applyBindings(viewModel, $("#d")[0])
  D.Setup()

D.SetupTemplates = () ->
  $( "#tones" ).append('<div id="d">
  D <span data-bind="visible: playing">playing</span>
</div>') 
 
D.CreateViewModel = () ->
  model = {}
  model.playing = ko.observable(false)
  model

D.Setup = () ->
  window.AudioContext = window.AudioContext or window.webkitAudioContext
  context = new AudioContext()
  Buffer = null
  bufferLoader = new BufferLoader(context, "/assets/d.wav", (buffer) ->
    Buffer = buffer
  )
  bufferLoader.load()

  $(window).on "D", ->
    D.ViewModel.playing(true)
    playSound context, Buffer, Buffer.duration
    console.log "D"
    setTimeout ->
      D.ViewModel.playing(false)
    , 200