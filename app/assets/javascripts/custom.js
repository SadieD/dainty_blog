$(document).on('turbolinks:load', function () {
  if ($(".flash").text().length > 0) {
    setTimeout(function() {
      $(".boop").fadeOut('fast');
      }, 2000)
  } else {
    $(".boop").hide();
  }
});
