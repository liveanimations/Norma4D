$ ->
  $('#facebook_image_image').on 'change', (event) ->
    image = event.target.files[0]
    reader = new FileReader

    reader.onload = (file) ->
      $('#image').html(
        "<img class='img-rounded' src='#{file.target.result}' style='width: 140px; height: 140px;'>"
        )

    reader.readAsDataURL image
