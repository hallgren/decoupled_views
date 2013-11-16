window.C ?= {}


C.InitialLoader = init: (dom_id_to_bind_to) ->
  #Property.Match.InitialLoader.SetupTemplates(dom_id_to_bind_to)
  viewModel = C.CreateViewModel()
  C.ViewModel = viewModel
  ko.applyBindings(viewModel, $(dom_id_to_bind_to)[0])
  C.Setup()

 
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
