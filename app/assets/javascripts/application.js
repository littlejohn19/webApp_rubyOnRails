// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery3
//= require popper
//= require bootstrap
//= require turbolinks
//= require_tree .

$(function () {

  $('#show').on('click', createseating);

});

//Note:In js the outer loop runs first then the inner loop runs completely so it goes o.l. then i.l. i.l .i.l .i.l. i.l etc and repeat

function createseating() {
  console.log('ss');

  var letters = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J'];

  var seatingValue = [];
  for (var i = 0; i < 10; i++) {
    for (var j = 0; j < 10; j++) {
      var seatingStyle = "<div class='seat available'>" + letters[j] + "" + ((i+1)*(j+1)) + "</div>";
      seatingValue.push(seatingStyle);

      if (j === 9) {
        var seatingStyle = "<div class='clearfix'></div>";
        seatingValue.push(seatingStyle);
      }
    }
  }

  $('#messagePanel').html(seatingValue);

  window.seats = '';

  var max = 0;
  $('.seat').on('click', function () {

    console.log(window.seats);
    if ($(this).hasClass("selected")) {
      max--;
      $(this).removeClass("selected");
    } else {
      if (max === 5) {
        $('#error').text('Możesz kupić maksymalnie 5 biletów!')
      }
      else {
        window.seats = window.seats + ' ' + $(this)[0].innerHTML;
        $(this).addClass("selected");
        max++;
      }
    }

    $('.seat').mouseenter(function () {
      $(this).addClass("hovering");

      $('.seat').mouseleave(function () {
        $(this).removeClass("hovering");

      });
    });
  });
}
