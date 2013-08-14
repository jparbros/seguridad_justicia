$(document).ready ->
  $('.edit-in-place-button').click (event) ->
    event.preventDefault()
    $('.save-in-place-button').show()
    $('#redactor-edit-content').redactor
      focus: true
  
  $('.save-in-place-button').click (event) ->
    event.preventDefault()
    html = $('#redactor-edit-content').redactor('get')
    identifier = $('meta[name=identifier]').attr('content')
    site_id = $('meta[name=site_id]').attr('content')
    page_id = $('meta[name=page_id]').attr('content')
    $.ajax "/admin/cms/sites/#{site_id}/pages/#{page_id}.js",
      type: 'PUT'
      data:
        page:
          blocks_attributes: [
            content: html,
            identifier: identifier
          ]
    $(this).hide()
    $('#redactor-edit-content').redactor('destroy')
