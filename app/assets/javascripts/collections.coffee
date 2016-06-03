$(function() {
  $('#collection_small_icon').on('change', function(event) {
    var image, reader;
    image = event.target.files[0];
    reader = new FileReader;
    reader.onload = function(file) {
      return $('#small_icon').html("<img class='img-rounded' src='" + file.target.result + "' style='width: 140px; height: 140px;'>");
    };
    return reader.readAsDataURL(image);
  });
  $('#collection_small_icon_2').on('change', function(event) {
    var image, reader;
    image = event.target.files[0];
    reader = new FileReader;
    reader.onload = function(file) {
      return $('#small_icon_2').html("<img class='img-rounded' src='" + file.target.result + "' style='width: 140px; height: 140px;'>");
    };
    return reader.readAsDataURL(image);
  });
  $('#collection_medium_icon').on('change', function(event) {
    var image, reader;
    image = event.target.files[0];
    reader = new FileReader;
    reader.onload = function(file) {
      return $('#medium_icon').html("<img class='img-rounded' src='" + file.target.result + "' style='width: 140px; height: 140px;'>");
    };
    return reader.readAsDataURL(image);
  });
  $('#collection_medium_icon_2').on('change', function(event) {
    var image, reader;
    image = event.target.files[0];
    reader = new FileReader;
    reader.onload = function(file) {
      return $('#medium_icon_2').html("<img class='img-rounded' src='" + file.target.result + "' style='width: 140px; height: 140px;'>");
    };
    return reader.readAsDataURL(image);
  });
  $('#collection_large_icon').on('change', function(event) {
    var image, reader;
    image = event.target.files[0];
    reader = new FileReader;
    reader.onload = function(file) {
      return $('#large_icon').html("<img class='img-rounded' src='" + file.target.result + "' style='width: 140px; height: 140px;'>");
    };
    return reader.readAsDataURL(image);
  });
  $('#collection_large_icon_2').on('change', function(event) {
    var image, reader;
    image = event.target.files[0];
    reader = new FileReader;
    reader.onload = function(file) {
      return $('#large_icon_2').html("<img class='img-rounded' src='" + file.target.result + "' style='width: 140px; height: 140px;'>");
    };
    return reader.readAsDataURL(image);
  });
  $('#commercial_image1').on('change', function(event) {
    var image, reader;
    image = event.target.files[0];
    reader = new FileReader;
    reader.onload = function(file) {
      return $('#image1').html("<img class='img-rounded' src='" + file.target.result + "' style='width: 140px; height: 140px;'>");
    };
    return reader.readAsDataURL(image);
  });
  $('#commercial_image2').on('change', function(event) {
    var image, reader;
    image = event.target.files[0];
    reader = new FileReader;
    reader.onload = function(file) {
      return $('#image2').html("<img class='img-rounded' src='" + file.target.result + "' style='width: 140px; height: 140px;'>");
    };
    return reader.readAsDataURL(image);
  });
});
