window.NotePlaying ?= {}


NotePlaying.init = () ->
  NotePlaying.SetupTemplates()
  viewModel = NotePlaying.CreateViewModel()
  NotePlaying.ViewModel = viewModel
  ko.applyBindings(viewModel, $("#note_playing")[0])
  NotePlaying.SetupBindings()
 

NotePlaying.SetupTemplates = () ->
  $( "body" ).append('<div id="note_playing">
  Playing <span data-bind="text: playing_note"></span>
</div>')



NotePlaying.SetupBindings = () ->
  $(window).on "E", ->
    NotePlaying.ViewModel.playing_note("E")
  $(window).on "F", ->
    NotePlaying.ViewModel.playing_note("F")
  $(window).on "G", ->
    NotePlaying.ViewModel.playing_note("G")
  $(window).on "C", ->
    NotePlaying.ViewModel.playing_note("C")
  $(window).on "D", ->
    NotePlaying.ViewModel.playing_note("D")

NotePlaying.CreateViewModel = () ->
  model = {}
  model.playing_note = ko.observable()
  model