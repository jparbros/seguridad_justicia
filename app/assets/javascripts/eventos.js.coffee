
window.Eventos =
  Models: {}
  Collections: {}
  Views: {}
  init: ->
    eventos = new Eventos.Collections.Eventos()
    eventos_view = new Eventos.Views.EventosIndex(collection: eventos)
    eventos.fetch()


class Eventos.Models.Evento extends Backbone.Model
  urlRoot: '/events.js'

class Eventos.Collections.Eventos extends Backbone.Collection
  url: '/events.js'
  model: window.Eventos.Models.Evento

class Eventos.Views.EventosIndex extends Backbone.View
  template: _.template('<li><span><a href="/events/<%= id %>"><%= title %></a></span><%= venue %> | <%= date %></li>')

  tagName: 'ul'

  initialize: ->
    @collection.on('reset', @render, @)

  render: ->
    if @collection.length > 0
      @renderCollection()
    else
      @renderEmpty()
    $('.events-container').append(@el)
    @

  renderCollection: ->
    _template = @template
    _el = @el
    @collection.each (model) ->
      $(_el).append(_template(model.toJSON()))

  renderEmpty: ->
      $(@el).append('<li><span>No hay eventos disponibles</span><li>')

$(document).ready ->
  Eventos.init()

