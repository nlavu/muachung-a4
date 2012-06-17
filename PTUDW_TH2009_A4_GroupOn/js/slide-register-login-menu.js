$(document).ready(function () {

    /* JAVASCRIPT FOR REGISTRY FORM */
    // Expand Panel
    $("#open").click(function () {
        $("div#panel").slideDown("slow");

    });

    // Collapse Panel
    $("#close").click(function () {
        $("div#panel").slideUp("slow");
    });

    // Switch buttons from "Register" to "Close Panel" on click
    $("#toggle a").click(function () {
        $("#toggle a").toggle();
    });

    /*
    // envent: click button register
    $('#bt_register').click(function() {
		
    var username = document.getElementById('log').value;
    var password = document.getElementById('pwd').value;
    var repassword = document.getElementById('repwd').value;
    var fullname = document.getElementById('companyName').value;
    var email = document.getElementById('email').value;
		
    // ajax: send data from client to server and registry
		
		
		
    $("#close").click();
    });
    */

    // JavaScript sleep by Java Applet
    function sleep(milliSeconds) {
        document.devCheater.sleep(milliSeconds);
    }

    // JAVASCRIPT FOR LOGIN FORM  
    $(".signin").click(function (e) {
        if (document.getElementById('close').style.display != 'none') {
            $("#close").click();
        }

        e.preventDefault();
        $("fieldset#signin_menu").toggle();
        $(".signin").toggleClass("menu-open");

        $("#username").focus();
    });


    $("fieldset#signin_menu").mouseup(function () {
        return false
    });

    $(document).mouseup(function (e) {
        if ($(e.target).parent("a.signin").length == 0) {
            $(".signin").removeClass("menu-open");
            $("fieldset#signin_menu").hide();
        }
    });

});
