# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  initCallback = (carousel) ->
    $('.jcarousel-control a').first().addClass('bullet-filled')

    $('.jcarousel-control a').bind('click', (event) ->
      event.preventDefault()
      $('.jcarousel-control a').removeClass('bullet-filled')
      $(this).addClass('bullet-filled')
      index = $(this).data('carousel') + 1
      carousel.scroll($.jcarousel.intval(index))
    );

  $('#carousel').jcarousel({
    scroll: 1,
    visible: 1,
    initCallback: initCallback,
    buttonNextHTML: null,
    buttonPrevHTML: null
  })

  $.get('/frases.json', (data) ->
    $("#phrases-box").jQCloud(data);
  )


