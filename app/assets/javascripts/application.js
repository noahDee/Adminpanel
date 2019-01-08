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
//= require turbolinks
//= require_tree .
$(document).ready(function(){
$(".panelToggle").click(function(){
    $(".userPanel").toggleClass("width200px width45px");
	$("i",this).toggleClass("fa-arrow-left fa-arrow-right");
	$(".userLogo img").toggleClass("width50p width90p");
	$(".userNameSpan").toggleClass("show hide");
	$(".userMenu span").toggleClass("show hide");
	$(".userMenu ul").toggleClass("showI2");
	$(".userMenu ul i").toggleClass("Icon Icon2");
});
});
