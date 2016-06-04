$ ->
  $('.characters-count-input').each ->
    count_field = $(this).parent().parent().find('.characters-count')
    document.getElementById(@id).onkeyup = ->
      count_field.text(@value.length)
