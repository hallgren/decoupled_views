window.G ?= {}


G.init = () ->
  G.SetupTemplates()
  viewModel = G.CreateViewModel()
  G.ViewModel = viewModel
  ko.applyBindings(viewModel, $("#g")[0])
  G.Setup()

G.SetupTemplates = () ->
  $( "#tones" ).append('<div id="g">
  G <span data-bind="visible: playing">playing</span>
</div>')
 
G.CreateViewModel = () ->
  model = {}
  model.playing = ko.observable(false)
  model

G.Setup = () ->

  $(window).on "G", ->
    G.ViewModel.playing(true)
    audio = new Audio("/assets/g.wav");
    audio.play()
    console.log "G"
    setTimeout ->
      G.ViewModel.playing(false)
    , 200
    