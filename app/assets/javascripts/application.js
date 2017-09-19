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

  $('#upload_homework').hide(); //Initially form wil be hidden.

    $('#homework_popup_button').click(function() {
    $('#upload_homework').toggle("slow");//Form shows on button click

   });
 });

 $(document).on('turbolinks:load', function()  {
   $('.file-import').attr('disabled', true);
   $('input:file').change(
     function(){
       if ($(this).val()){
         $('.file-import').removeAttr('disabled');
       } else {
         $('.file-import').attr('disabled', true);
       }
     }
   );
 });

 // $(document).on('turbolinks:load', function()  {
  //  $('#assignment-import').attr('disabled', true);
  //  $('input:file').change(
    //  function(){
      //  if ($(this).val()){
        //  $('#assignment-import').removeAttr('disabled');
      //  } else {
        //  $('#assignment-import').attr('disabled', true);
      //  }
    //  }
  //  );
 // });

function textLength(value){
   var maxLength = 10;
   var letter = 'a';
   if(value.length > maxLength) return false;
   else if (value === letter) return false;
   return true;
};

// function yellowBackground() {
  // $(this).css("background-color", "yellow");
// };

// $(document).on('turbolinks:load', function() {
  // $("#password").on ({
  	// focus: function() {
    	// $(this).css("background-color", "yellow");
    // },
    // keyup: function(){
      // if(!textLength(this.value)) alert('text is too long!');
    // }
  // })
// });






  // $("password").onfocus ({
  //   $(this).css("background-color", "yellow")
  // });
    // mouseleave: function() {
    // 	$(this).css("color", "black");
    // },
  	// click: function() {
    // 	$(".two").animate({left: "50px"});
    // },



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
