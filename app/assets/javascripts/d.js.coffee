window.D ?= {}


D.InitialLoader = init: (dom_id_to_bind_to) ->
  #Property.Match.InitialLoader.SetupTemplates(dom_id_to_bind_to)
  viewModel = D.CreateViewModel()
  D.ViewModel = viewModel
  ko.applyBindings(viewModel, $(dom_id_to_bind_to)[0])
  D.Setup()

 
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