window.NotePlaying ?= {}


NotePlaying.InitialLoader = init: (dom_id_to_bind_to) ->
  #Property.Match.InitialLoader.SetupTemplates(dom_id_to_bind_to)
  viewModel = NotePlaying.CreateViewModel()
  NotePlaying.ViewModel = viewModel
  ko.applyBindings(viewModel, $(dom_id_to_bind_to)[0])
  NotePlaying.SetupBindings()
 
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