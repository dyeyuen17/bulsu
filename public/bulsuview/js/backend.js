$(document).ready(function(){
  $('.sign-in-form').submit(function(e){
    signin();
    e.preventDefault();
  });
  $('.sign-up-form').submit(function(e){
    signup();
    e.preventDefault();
  });
  $('.post-form').submit(function(e){
    post();
    e.preventDefault();
  })
})
//SIGNUP
function signup(){
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
//SIGNIN
function signin(){
  $.ajax({
    url: 'http://localhost:4000/api/login',
    type: 'POST',
    data: {
        username: $('.username').val(),
        password: $('.password').val()
    },
    success: function(res){
      console.log('Success',res);
      location.href = 'homepage.html';
    },
    error : function(res){
      console.log('Error',res);
    }

  });
}
//HOMEPAGE
function post(){
  alert('aa');
}
