$ ->
  $('#collection_small_icon').on 'change', (event) ->
    image = event.target.files[0]
    reader = new FileReader

    reader.onload = (file) ->
      $('#small_icon').html "<img class='img-rounded' src='#{file.target.result}' style='width: 140px; height: 140px;'>"

    reader.readAsDataURL image
  $('#collection_small_icon_2').on 'change', (event) ->
    image = event.target.files[0]
    reader = new FileReader

    reader.onload = (file) ->
      $('#small_icon_2').html "<img class='img-rounded' src='#{file.target.result}' style='width: 140px; height: 140px;'>"

    reader.readAsDataURL image
  $('#collection_medium_icon').on 'change', (event) ->
    image = event.target.files[0]
    reader = new FileReader

    reader.onload = (file) ->
      $('#medium_icon').html "<img class='img-rounded' src='#{file.target.result}' style='width: 140px; height: 140px;'>"

    reader.readAsDataURL image
  $('#collection_medium_icon_2').on 'change', (event) ->
    image = event.target.files[0]
    reader = new FileReader

    reader.onload = (file) ->
      $('#medium_icon_2').html "<img class='img-rounded' src='#{file.target.result}' style='width: 140px; height: 140px;'>"

    reader.readAsDataURL image
  $('#collection_large_icon').on 'change', (event) ->
    image = event.target.files[0]
    reader = new FileReader

    reader.onload = (file) ->
      $('#large_icon').html "<img class='img-rounded' src='#{file.target.result}' style='width: 140px; height: 140px;'>"

    reader.readAsDataURL image
  $('#collection_large_icon_2').on 'change', (event) ->
    image = event.target.files[0]
    reader = new FileReader

    reader.onload = (file) ->
      $('#large_icon_2').html "<img class='img-rounded' src='#{file.target.result}' style='width: 140px; height: 140px;'>"

    reader.readAsDataURL image
  $('#commercial_image1').on 'change', (event) ->
    image = event.target.files[0]
    reader = new FileReader

    reader.onload = (file) ->
      $('#image1').html "<img class='img-rounded' src='#{file.target.result}' style='width: 140px; height: 140px;'>"

    reader.readAsDataURL image
  $('#commercial_image2').on 'change', (event) ->
    image = event.target.files[0]
    reader = new FileReader

    reader.onload = (file) ->
      $('#image2').html "<img class='img-rounded' src='#{file.target.result}' style='width: 140px; height: 140px;'>"

    reader.readAsDataURL image
