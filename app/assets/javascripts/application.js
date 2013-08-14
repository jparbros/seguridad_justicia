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
//= require bootstrap
//= require backbone-min
//= require jquery.jcarousel.min
//= require jqcloud.min
//= require jquery.tweet
//= require polygonzo
//= require mapa
//= require home
//= require eventos
//= require events_posts
//= require google_maps
//= require coords/baja_california
//= require coords/chihuahua
//= require coords/nuevo_leon
//= require sections/baja_california
//= require sections/chihuahua
//= require sections/nuevo_leon
//= require comfortable_mexican_sofa/lib/es
//= require comfortable_mexican_sofa/lib/redactor
//= require redactor


$(function() {
  $('a.youtube-link').each(function() {
      var yt_url   = this.href,
          yt_id    = yt_url.split('/')[4],
          yt_title = $(this).text();
      $(this).replaceWith('<div class="youtube-box"><img class="youtube-box-image" src="http://img.youtube.com/vi/' + yt_id + '/0.jpg"><span class="youtube-title">' + yt_title + '</span><span class="youtube-bar"><span class="yt-bar-left"></span><span class="yt-bar-right"></span></span><span class="youtube-play"></span></div>');
      $('div.youtube-box').click(function() {
          $(this).replaceWith('<iframe class="youtube-frame" src="' + yt_url + '?autoplay=1"></iframe>');
      });
  });
});

