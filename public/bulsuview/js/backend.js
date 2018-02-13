$(document).ready(function(){
  $('.sign-in-form').submit(function(e){

    e.preventDefault();
  });
  $('.sign-up-form').submit(function(e){
    signup();
    e.preventDefault();
  });


})
function signup(){
  // $.post('http://localhost:4000/api/new',{
  //   firstname: $('.firstname').val(),
  //   lastname:  $('.lastname').val(),
  //   email: $('.email').val(),
  //   username: $('.username').val(),
  //   password: $('.password').val(),
  // }).done(function(res){
  //   console.log(res);
  // });

  $.ajax({
     url: 'http://localhost:4000/api/new',
     type: 'POST',
     data: {
        firstname: $('.firstname').val(),
        lastname:  $('.lastname').val(),
        email: $('.email').val(),
        username: $('.username').val(),
        password: $('.password').val(),
        },
     success: function(res) {
       console.log('s',res);
     },
     error : function(res) {
       console.log('e',res);
     }
       });


}
