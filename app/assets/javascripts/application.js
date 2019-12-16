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
//= require activestorage
//= require multiple_steps_form
//= require favorite_button



$(window).scroll(function() {
    if ($(this).scrollTop() >= 50) {        // If page is scrolled more than 50px
        $('#return-to-top').fadeIn(200);    // Fade in the arrow
    } else {
        $('#return-to-top').fadeOut(200);   // Else fade out the arrow
    }
});
$('#return-to-top').click(function() {      // When arrow is clicked
    $('body,html').animate({
        scrollTop : 0                       // Scroll to top of body
    }, 500);
});
  var isInViewport = function (elem) {
    var bounding = elem.getBoundingClientRect();
    return (
      bounding.top >= 0 &&
      bounding.left >= 0 &&
      bounding.bottom <= (window.innerHeight || document.documentElement.clientHeight) &&
      bounding.right <= (window.innerWidth || document.documentElement.clientWidth)
      );
  };
  var IsJumbotronPass = false
  $(window).scroll(function(){
    console.log()
    var home = document.querySelector('.text-center');
    if (document.querySelector('body').getBoundingClientRect().top < -850) {
      if (IsJumbotronPass == false) {
        IsJumbotronPass = true
        $('nav').addClass('affix')
      }
    } else {
      if (IsJumbotronPass == true) {
        IsJumbotronPass = false
        $('nav').removeClass('affix')
      }
    }
  });


if (
  (
    document.documentElement.textContent || document.documentElement.innerText
  ).indexOf('Notre Selection') > -1 
) {

} else {
	 $('nav').addClass('affix')
};


if (
  (
    document.documentElement.textContent || document.documentElement.innerText
  ).indexOf('Mon Profil') > -1 
) {

} else {
   $('nav').addClass('affix')
}