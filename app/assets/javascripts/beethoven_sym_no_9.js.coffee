
#$(document).ready ->

window.Beethoven ?= {}


Beethoven.init = (dom_id_to_bind_to) ->
  #Property.Match.InitialLoader.SetupTemplates(dom_id_to_bind_to)
  viewModel = Beethoven.CreateViewModel()
  Beethoven.ViewModel = viewModel
  element = $(dom_id_to_bind_to)[0]; 
  ko.cleanNode(element);
  ko.applyBindings(viewModel, element)
 

Beethoven.CreateViewModel = () ->
  model = {}
  model.name = ko.observable("Beethoven")

  model.play = () ->
    Beethoven.Play()
  model

Beethoven.Play = () ->
  setTimeout ->
    $(window).trigger "C"
  , 100
  setTimeout ->
    $(window).trigger "D"
  , 500
  setTimeout ->
    $(window).trigger "E"
  , 1000

  setTimeout ->
    $(window).trigger "C"
  , 1500
  setTimeout ->
    $(window).trigger "D"
  , 2000
  setTimeout ->
    $(window).trigger "E"
  , 2500

  setTimeout ->
    $(window).trigger "E"
  , 3000
  setTimeout ->
    $(window).trigger "E"
  , 3500
  setTimeout ->
    $(window).trigger "E"
  , 4000
  setTimeout ->
    $(window).trigger "D"
  , 4500
  setTimeout ->
    $(window).trigger "D"
  , 5000
  setTimeout ->
    $(window).trigger "D"
  , 5500
  setTimeout ->
    $(window).trigger "C"
  , 6000
  setTimeout ->
    $(window).trigger "C"
  , 6500
  setTimeout ->
    $(window).trigger "C"
  , 7000
  setTimeout ->
    $(window).trigger "D"
  , 7500
  setTimeout ->
    $(window).trigger "E"
  , 8000
  setTimeout ->
    $(window).trigger "F"
  , 8500
  setTimeout ->
    $(window).trigger "G"
  , 9000
  setTimeout ->
    $(window).trigger "G"
  , 9500
  setTimeout ->
    $(window).trigger "F"
  , 10000
  setTimeout ->
    $(window).trigger "E"
  , 10500
  setTimeout ->
    $(window).trigger "D"
  , 11000
  setTimeout ->
    $(window).trigger "C"
  , 11500
  setTimeout ->
    $(window).trigger "C"
  , 12000
  setTimeout ->
    $(window).trigger "D"
  , 12500
  setTimeout ->
    $(window).trigger "E"
  , 13000
  setTimeout ->
    $(window).trigger "D"
  , 13500
  setTimeout ->
    $(window).trigger "C"
  , 14000
  setTimeout ->
    $(window).trigger "C"
  , 14500