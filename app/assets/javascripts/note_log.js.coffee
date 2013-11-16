window.NoteLog ?= {}


NoteLog.init = (dom_id_to_bind_to) ->
  NoteLog.SetupTemplates()
  viewModel = NoteLog.CreateViewModel()
  NoteLog.ViewModel = viewModel
  ko.applyBindings(viewModel, $(dom_id_to_bind_to)[0])
  NoteLog.SetupBindings()
 
NoteLog.SetupTemplates = () ->
  $( "body" ).append('<div id="log">
  <h1>Log</h1>
  <div data-bind="foreach: log">
    <label data-bind="text: note"></label>
  <div>
<div>')


NoteLog.SetupBindings = () ->
  $(window).on "E", ->
    NoteLog.ViewModel.log.push({note: "E"})
  $(window).on "F", ->
    NoteLog.ViewModel.log.push({note: "F"})
  $(window).on "G", ->
    NoteLog.ViewModel.log.push({note: "G"})
  $(window).on "C", ->
    NoteLog.ViewModel.log.push({note: "C"})
  $(window).on "D", ->
    NoteLog.ViewModel.log.push({note: "D"})

NoteLog.CreateViewModel = () ->
  model = {}
  model.log = ko.observableArray()
  model