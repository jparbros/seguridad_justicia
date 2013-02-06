// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require underscore-min
//= require backbone-min
//= require jquery.jcarousel.min
//= require jqcloud.min
//= require jquery.tweet
//= require jquery.ui.min
//= require bootstrap.min
//= require polygonzo
//= require coords/baja_california
//= require coords/chihuahua
//= require coords/nuevo_leon
//= require sections/baja_california
//= require sections/chihuahua
//= require sections/nuevo_leon

//= require_tree .

$('.phase-header').live('click', function() {
  phaseToShow = $(this).data('phase');
  divtoShow = $('#' + phaseToShow);
  show = divtoShow.is(':hidden')
  $('#phase-one, #phase-two, #phase-three').hide(500);
  if(show)
    divtoShow.fadeIn().css("display","inline-block");
});