$(document).on('turbolinks:load', function () {
  if ($(".flash").text().length > 0) {
    setTimeout(function() {
      $(".panel-success").fadeOut('fast');
      }, 3000)
  } else {
    $(".panel-success").hide();
  }
});
