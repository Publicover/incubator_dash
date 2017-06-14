// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).on('turbolinks:load', function()  {
// $(document).on 'turbolinks:load', ->
// $(document).on('page:change', function(){
// 8009 foxwood road

  $('#upload_homework').hide(); //Initially form wil be hidden.

    $('#homework_popup_button').click(function() {
    $('#upload_homework').toggle("slow");//Form shows on button click

   });
 });

 // $(document).on('turbolinks:load', function() {

  // $(window).scroll(function () {
      //if you hard code, then use console
      //.log to determine when you want the
      //nav bar to stick.
      // console.log($(window).scrollTop())
    // if ($(window).scrollTop() > 2 ) {
      // $('#top-nav').addClass('navbar-fixed');
    // }
    // if ($(window).scrollTop() < 2 ) {
      // $('#top-nav').removeClass('navbar-fixed');
    // }
  // });
// });
