$(document).ready(function() {
  generateRestaurantListener();
});

function generateRestaurantListener() {
  $("#generator-form").on("click", function(event) {
    $(this).prop("disabled",true);
    event.preventDefault();
    $buttonForm = $(this);
    buttonUrl = $buttonForm.attr("action");
    buttonMethod = $buttonForm.attr("method");

    promise = $.ajax({
      url: buttonUrl,
      method: buttonMethod
    });

    promise.done(function(response) {
      $(".error_messages").remove();
      $(".restaurant-details").hide();
      $buttonForm.hide();
      $("#main-header").find("small").append(response);
    });

  });
};
