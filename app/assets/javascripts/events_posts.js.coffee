
window.EventosPosts =
  Models: {}
  Collections: {}
  Views: {}
  init: ->
    eventosPosts = new EventosPosts.Collections.Posts()
    eventos_view = new EventosPosts.Views.EventosPostIndex(collection: eventosPosts)
    eventosPosts.fetch()


class EventosPosts.Models.Post extends Backbone.Model
  urlRoot: '/events/posts.js'

class EventosPosts.Collections.Posts extends Backbone.Collection
  url: '/events/posts.js'
  model: window.EventosPosts.Models.Post

class EventosPosts.Views.EventosPostIndex extends Backbone.View
  template: _.template('<li><span><a href="/events/posts/<%= id %>"><%= title %></a></span><%= published_at %></li>')

  tagName: 'ul'

  initialize: ->
    @collection.on('reset', @render, @)

  render: ->
    if @collection.length > 0
      @renderCollection()
    else
      @renderEmpty()
    $('.events-posts-container').append(@el)
    @

  renderCollection: ->
    _template = @template
    _el = @el
    @collection.each (model) ->
      $(_el).append(_template(model.toJSON()))

  renderEmpty: ->
      $(@el).append('<li><span>No hay eventos disponibles</span><li>')

$(document).ready ->
  EventosPosts.init()

