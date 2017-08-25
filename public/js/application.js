$(document).ready(function() {
  generateRestaurantListener();
});

function generateRestaurantListener() {
  $("#generator-form").on("click", function(event) {
    event.preventDefault();
    $buttonForm = $(this);
    buttonUrl = $buttonForm.attr("action");
    buttonMethod = $buttonForm.attr("method");

    promise = $.ajax({
      url: buttonUrl,
      method: buttonMethod
    });

    promise.done(function(response) {
      $(".error_messages").remove()
      $buttonForm.hide();
      $("#main-header").find("small").append(response);
    });

  });
};
