
#$(document).ready ->

window.Morgan ?= {}


Morgan.init = () ->
  Morgan.SetupTemplates()
  viewModel = Morgan.CreateViewModel()
  Morgan.ViewModel = viewModel
  element = $("#morgan")[0]; 
  ko.cleanNode(element);
  ko.applyBindings(viewModel, element)
 
Morgan.SetupTemplates = () ->
  $( "body" ).append('<div id="morgan">
  <label data-bind="text: name"></label>
  <button data-bind="click: play">play</button>
</div>')


Morgan.CreateViewModel = () ->
  model = {}
  model.name = ko.observable("Morgan")

  model.play = () ->
    Morgan.Play()

  model

Morgan.Play = () ->
  setTimeout ->
    $(window).trigger "C"
  , 100
  setTimeout ->
    $(window).trigger "D"
  , 400
  setTimeout ->
    $(window).trigger "E"
  , 900

  setTimeout ->
    $(window).trigger "C"
  , 1500
  setTimeout ->
    $(window).trigger "D"
  , 1900
  setTimeout ->
    $(window).trigger "E"
  , 2400

  setTimeout ->
    $(window).trigger "E"
  , 2900
  setTimeout ->
    $(window).trigger "E"
  , 3100
  setTimeout ->
    $(window).trigger "E"
  , 3300
  setTimeout ->
    $(window).trigger "E"
  , 3500
  setTimeout ->
    $(window).trigger "D"
  , 3700
  setTimeout ->
    $(window).trigger "D"
  , 3900
  setTimeout ->
    $(window).trigger "D"
  , 4100
  setTimeout ->
    $(window).trigger "D"
  , 4300
  setTimeout ->
    $(window).trigger "C"
  , 4700
  setTimeout ->
    $(window).trigger "D"
  , 5200
  setTimeout ->
    $(window).trigger "E"
  , 5700


