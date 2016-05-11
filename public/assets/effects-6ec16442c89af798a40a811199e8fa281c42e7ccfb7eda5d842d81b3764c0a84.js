(function() {
  $(function() {
    $('#effect_small_icon').on('change', function(event) {
      var image, reader;
      image = event.target.files[0];
      reader = new FileReader;
      reader.onload = function(file) {
        return $('#small_icon').html("<img class='img-rounded' src='" + file.target.result + "' style='width: 140px; height: 140px;'>");
      };
      return reader.readAsDataURL(image);
    });
    $('#effect_small_icon_2').on('change', function(event) {
      var image, reader;
      image = event.target.files[0];
      reader = new FileReader;
      reader.onload = function(file) {
        return $('#small_icon_2').html("<img class='img-rounded' src='" + file.target.result + "' style='width: 140px; height: 140px;'>");
      };
      return reader.readAsDataURL(image);
    });
    $('#effect_large_icon').on('change', function(event) {
      var image, reader;
      image = event.target.files[0];
      reader = new FileReader;
      reader.onload = function(file) {
        return $('#large_icon').html("<img class='img-rounded' src='" + file.target.result + "' style='width: 140px; height: 140px;'>");
      };
      return reader.readAsDataURL(image);
    });
    return $('#effect_large_icon_2').on('change', function(event) {
      var image, reader;
      image = event.target.files[0];
      reader = new FileReader;
      reader.onload = function(file) {
        return $('#large_icon_2').html("<img class='img-rounded' src='" + file.target.result + "' style='width: 140px; height: 140px;'>");
      };
      return reader.readAsDataURL(image);
    });
  });

}).call(this);
