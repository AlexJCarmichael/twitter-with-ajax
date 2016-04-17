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

    var checkAndAddNewComments = function () {
        var url = document.URL;
        $(".vivek-parent").html("");
        $.getJSON(url, function (response) {
            console.log(response);
            response.forEach(function (vivek) {
                $(".vivek-parent").append("<p>" +
                "<a class='show-dane' href='danes/" + vivek.dane_id + "' >" +
                vivek.dane_danish +
                "</a>" +
                "<a class='show-vivek' href='viveks/" + vivek.id + "'>" +
                vivek.body +
                "</p>" +
                "<p class='time'>" +
                vivek.time +
                "</p>"
              );
            });
        }
    );};

    // setInterval(function () {
    //     checkAndAddNewComments();
    // }, 1000);

    var $newVivek = $("#new-tweet");
    $("#new-tweet[data-remote]").on("ajax:success", function() { //Ask about e, data, etc.
        checkAndAddNewComments();
        $newVivek.find("#vivek_body").val("");
    });
    $newVivek.on("ajax:error", function(e, data) {
        $newVivek.append("<p>" + data.body + "</p>");
    });

    if (($("#vivek_body").val().length < 3)) {
        $("#hide-new-tweet").prop("disabled", true);
    }

    $("#vivek_body").on("keydown focus", function () {
        var input_val = $(this).val();
        $("#tweet-apropos").html("");
        $("#tweet-apropos").html((140 - input_val.trim().length) + " characters left.");
        if ((input_val.trim().length <2) || (input_val.trim().length > 140)) {
            if (input_val.trim().length < 2) {
                $("#tweet-apropos").html("");
                $("#tweet-apropos").html((140 - input_val.trim().length) + " characters left. Tweet must be more than 2 characters");
            } else if (input_val.trim().length > 140) {
                $("#tweet-apropos").html("");
                $("#tweet-apropos").html((140 - input_val.trim().length) + " characters left. Tweet must be less than 141 characters");
            }
            $("#tweet-apropos").addClass("field_with_errors");
            $("#hide-new-tweet").prop("disabled", true);
        } else {
            $("#tweet-apropos").removeClass("field_with_errors");
            $("#hide-new-tweet").prop("disabled", false);
        }
    });
};



$(document).ready(clicky);
$(document).on("page:load", clicky);
