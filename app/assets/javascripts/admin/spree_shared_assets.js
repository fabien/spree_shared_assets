$(function() {
  var $cropbox = $('.basic-table .cropbox');
  $cropbox.each(function() {
    $(this).width($(this).width());
    $(this).css('float', 'none');
    var $img = $(this).children('img').detach();
    if ($img.is('*')) {
      $(this).css('background-image', 'url("' + $img.attr('src') + '")');
    }
  });
  
  $('.edit-offset .slider').each(function() {
    var $input = $(this).parent().find('input[type=text]').hide();
    var $display = $(this).parent().prev('td').find('strong');
  
    $(this).slider({ min: 0, max: 100, step: 5, 
      change: function(event, slider) {
        $input.val(slider.value);
        $display.text(slider.value + '%');
        var position = $cropbox.css('backgroundPosition').split(' ');
        if ($input.attr('id').match(/_x$/)) {
          position[0] = $input.val() + '%';
        } else if ($input.attr('id').match(/_y$/)) {
          position[1] = $input.val() + '%';
        }
        $cropbox.css('backgroundPosition', position.join(' '));
      },
      slide: function(event, slider) {
        $display.text(slider.value + '%');
      }
    }).slider('option', 'value', $input.val())
  });
});