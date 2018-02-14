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
        localStorage.setItem("username", res.data.username);
    },
    error : function(res){
      console.log('Error',res);
    }

  });
}
//HOMEPAGE
function post(){
  $.ajax({
    url: 'http://localhost:4000/api/post',
    type: 'POST',
    data: {
      post: {
        username: localStorage.getItem('username'),
        content:$('.post').val()
      }
    },
    success: function(res){
      console.log('S');
      show();
    },
    error: function(res){
      console.log('E');
    }
  });
}
//POSTS
function show(){
  $.ajax({
      url: 'http://localhost:4000/api/get-post',
      type: 'POST',
      data: {
      username: localStorage.getItem('username')
      },
      success: function(res){
        get_posts(res);
      },
      error: function(res){
        console.log(res);
      }
  });
}
function get_posts(res){
  $.each(res.data, function(i, d){
      $('.post-container').append('<br>' + d.content +' '+d.inserted_at + '<br>');
     });
}
