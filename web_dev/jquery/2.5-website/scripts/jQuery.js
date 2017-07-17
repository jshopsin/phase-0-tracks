$(document).ready(function() {
  $('.story-block').on('mouseover', '.text', function() {
    $(this).after('<h1>Aren\'t they are so cute?!</h1>');
    $(this).remove();
  });
});