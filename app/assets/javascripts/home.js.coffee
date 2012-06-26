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

  itemLoadCallback = (carousel, state) ->
    if state == 'next'
      bullet_filled = $('a.bullet-filled')
      bullet_filled.removeClass('bullet-filled')
      bullet_filled.next().addClass('bullet-filled')
    if state == 'prev'
      $('a.bullet-filled').removeClass('bullet-filled')
      $('.jcarousel-control').children().first().addClass('bullet-filled')

  if($('#carousel img').size() > 0)
    $('#carousel').jcarousel({
      auto: 5,
      wrap: 'last',
      scroll: 1,
      visible: 1,
      initCallback: initCallback,
      buttonNextHTML: null,
      buttonPrevHTML: null,
      itemLoadCallback: {onBeforeAnimation: itemLoadCallback}
    })

  initializeCloude = true

  $('.sentir-ciudadano').click( ->
    $('#phase_one').toggle()
    if $(this).is(":visible") == true and initializeCloude == true
      initializeCloude = false
      $.get('/frases.json', (data) ->
        $("#phrases-box").jQCloud(data)
      )
  );

  $('.awnsers div').first().show()

  $('a.question_link').click( (event) ->
    event.preventDefault()
    question_link = $(@).data('question-id')
    $('.awnsers > div').hide()
    question_div = $('#question-' + question_link);
    question_div.show();
    top_position = question_div.position().top - 120
    $('html, body').animate({scrollTop:(top_position-40px)}, 'slow');
  )