$(function(){
  $('#browserid-login').click(function(e){
    e.preventDefault();

    navigator.id.get(function(assertion) {
      if (assertion != null) {
        var autologin = $('#autologin').is(':checked');

        $('#browserid_assertion').val(assertion);
        // don't want to send autologin in form if autologin not checked
        $('#browserid_autologin').prop('disabled', !autologin);
        $('#browserid-login-form').submit();
      }
    });
  });
});
