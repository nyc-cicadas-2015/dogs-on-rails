$(document).ready(function() {
  $('#login_form').on('submit', function(event) {
    event.preventDefault();

    $.ajax({
      method: 'POST',
      url: '/session',
      data: $(event.target).serialize(),
      dataType: 'json'
    }).done(function(data){
      $('#logged_out').toggle();
      $('#logged_in').toggle();
    }).fail(function(error) {
      console.log("Unable to log in: " + error.responseText.message);
    });
  })
})
