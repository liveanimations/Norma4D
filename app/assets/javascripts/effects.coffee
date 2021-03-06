$ ->
  $('#effect_small_icon').on 'change', (event) ->
    image = event.target.files[0]
    reader = new FileReader

    reader.onload = (file) ->
      $('#small_icon').html(
        "<img class='img-rounded' src='#{file.target.result}' style='width: 140px; height: 140px;'>"
        )

    reader.readAsDataURL image

  $('#effect_small_icon_2').on 'change', (event) ->
    image = event.target.files[0]
    reader = new FileReader

    reader.onload = (file) ->
      $('#small_icon_2').html(
        "<img class='img-rounded' src='#{file.target.result}' style='width: 140px; height: 140px;'>"
        )

    reader.readAsDataURL image

  $('#effect_large_icon').on 'change', (event) ->
    image = event.target.files[0]
    reader = new FileReader

    reader.onload = (file) ->
      $('#large_icon').html(
        "<img class='img-rounded' src='#{file.target.result}' style='width: 140px; height: 140px;'>"
        )

    reader.readAsDataURL image

  $('#effect_large_icon_2').on 'change', (event) ->
    image = event.target.files[0]
    reader = new FileReader

    reader.onload = (file) ->
      $('#large_icon_2').html(
        "<img class='img-rounded' src='#{file.target.result}' style='width: 140px; height: 140px;'>"
        )

    reader.readAsDataURL image
