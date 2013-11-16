window.E ?= {}


E.InitialLoader = init: (dom_id_to_bind_to) ->
  #Property.Match.InitialLoader.SetupTemplates(dom_id_to_bind_to)
  viewModel = E.CreateViewModel()
  E.ViewModel = viewModel
  ko.applyBindings(viewModel, $(dom_id_to_bind_to)[0])
  E.Setup()

 
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