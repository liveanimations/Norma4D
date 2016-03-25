// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .

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
  $('#collection_large_icon').on('change', function(event) {
    var image, reader;
    image = event.target.files[0];
    reader = new FileReader;
    reader.onload = function(file) {
      return $('#large_icon').html("<img class='img-rounded' src='" + file.target.result + "' style='width: 140px; height: 140px;'>");
    };
    return reader.readAsDataURL(image);
  });
  return $('#collection_large_icon_2').on('change', function(event) {
    var image, reader;
    image = event.target.files[0];
    reader = new FileReader;
    reader.onload = function(file) {
      return $('#large_icon_2').html("<img class='img-rounded' src='" + file.target.result + "' style='width: 140px; height: 140px;'>");
    };
    return reader.readAsDataURL(image);
  });
});
