$('#cb-begin').click(function() {
  $.post('/user/stars/refresh')
  .success(function(data) {
    console.log(data);
  });
});
