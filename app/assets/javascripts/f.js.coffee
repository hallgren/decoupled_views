window.F ?= {}


F.InitialLoader = init: (dom_id_to_bind_to) ->
  #Property.Match.InitialLoader.SetupTemplates(dom_id_to_bind_to)
  viewModel = F.CreateViewModel()
  F.ViewModel = viewModel
  ko.applyBindings(viewModel, $(dom_id_to_bind_to)[0])
  F.Setup()

 
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