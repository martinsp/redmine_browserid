$(function(){
  $('#browserid-login').click(function(e){
    e.preventDefault();
    navigator.id.get(function(assertion) {
      if (assertion != null) {
        $('#browserid_assertion').val(assertion);
        $('#browserid-login-form').submit();
      }
    });
  });
});
