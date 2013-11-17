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

  $(window).on "F", ->
    audio = new Audio("/assets/f.wav");
    F.ViewModel.playing(true)
    audio.play()
    console.log "F"
    setTimeout ->
      F.ViewModel.playing(false)
    , 200