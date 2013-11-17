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

  $(window).on "E", ->
    audio = new Audio("/assets/e.wav");
    E.ViewModel.playing(true)
    audio.play()
    console.log "E"
    setTimeout ->
      E.ViewModel.playing(false)
    , 200