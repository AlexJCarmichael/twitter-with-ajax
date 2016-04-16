/* globals $ */
// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require materialize-sprockets
//= require_tree .

var clicky = function () {
    $("#show-new-tweet, #hide-new-tweet").on("click", function () {
        $("#new-tweet").toggleClass("hide-me");
    });
    var $newVivek = $("#new-tweet");
    $newVivek.on("ajax:success", function(e, data) {
        $newVivek.append("<p>" + data.message + "</p>");
        $newVivek.find("#vivek_body").val("");
    });
    $newVivek.on("ajax:error", function(e, data) {
        $newVivek.append("<p>" + data.message + "</p>");
    });
};



$(document).ready(clicky);
$(document).on("page:load", clicky);
