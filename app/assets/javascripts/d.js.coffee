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

  $(window).on "D", ->
    audio = new Audio("/assets/d.wav");
    D.ViewModel.playing(true)
    audio.play()
    console.log "D"
    setTimeout ->
      D.ViewModel.playing(false)
    , 200