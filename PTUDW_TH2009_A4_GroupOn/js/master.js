

$(document).ready(function () {

    $("#my_account").click(function () {
        $.ajax({
            type: "POST",
            url: "MasterPage.aspx/KiemTraTrangThai",
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (html) {
                if (html.d == "") {
                    alert("Please Log in before go to My account!");
                    $(".signin").click();
                }
                else {
                    document.location = "InfoAccount.aspx";
                }
            }
        });
    });

    // an quang cao cua somee
    $("#sm_frm1").hide();

    $(".signout").hide();
    $(".signin").hide();

    // kiem tra trang thai dang nhap
    KiemTraTrangThaiDangNhap();

    function KiemTraTrangThaiDangNhap() {
        $.ajax({
            type: "POST",
            url: "MasterPage.aspx/KiemTraTrangThai",
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (html) {
                if (html.d == "") {
                    $(".signin").show();
                    $(".signout").hide();
                }
                else {
                    $(".signin").hide();
                    $(".signout").show();
                    document.getElementById("name_user").innerHTML = html.d;
                }
            }
        });
    }

    /*
    // tao menu cho trang web
    $.ajax({
    type: "POST",
    url: "MasterPage.aspx/CreateMenu",
    data: "{}",
    contentType: "application/json; charset=utf-8",
    dataType: "json",
    success: function (html) {
    $("#horiz-navigation-1").html(html.d);
    }
    });
    */

    // dang xuat
    $(".signout").click(function () {
        $.ajax({
            type: "POST",
            url: "MasterPage.aspx/DangXuat",
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (html) {
                if (html.d == "false") {
                    $(".signin").show();
                    $(".signout").hide();

                    document.getElementById("name_user").innerHTML = "Guest";
                }
                else {
                }
            }
        });

        $(".signin").show();
        $(".signout").hide();
    });


    // dang nhap
    $("#signin_submit").click(function () {
        var Username = $("#username").val();
        var Password = $("#password").val();

        if (Username == "") {
            alert("Please enter your Username.");
            $("#username").focus();
            return false;
        }

        if (Password == "") {
            alert("Please enter your Password.");
            $("#password").focus();
            return false;
        }

        var dataInfo = "{'Username':'" + Username + "', 'Password':'" + Password + "'}";

        $.ajax({
            type: "POST",
            url: "MasterPage.aspx/XuLiDangNhap",
            data: dataInfo,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (html) {
                if (html.d == "") {
                    alert("This Username and Password is not associated with an existing customer. Please, try again!");
                    $("#password").val('');
                    $("#password").focus();
                }
                else {

                    $(".signin").hide();
                    $(".signout").show();
                    document.getElementById("name_user").innerHTML = html.d;

                    $(".signin").removeClass("menu-open");
                    $("fieldset#signin_menu").hide();
                }
            }
        });
    });

    // check email address
    function validateEmail(elementValue) {
        var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
        return emailPattern.test(elementValue);
    }

    // xu li dang ki
    $("#bt_register").click(function () {
        alert("Invalid!");
        return;

        var Username = $("#log").val();
        var Password = $("#pwd").val();
        var rePassword = $("#repwd").val();
        var Companyname = $("#companyName").val();
        var Email = $("#email").val();

        if (Username == "") {
            alert("Please enter your Username.");
            $("#log").focus();
            return false;
        }

        if (Password == "") {
            alert("Please enter your Password.");
            $("#pwd").focus();
            return false;
        }

        if (rePassword == "") {
            alert("Please enter your Password confirmation.");
            $("#repwd").focus();
            return false;
        }

        if (Password != rePassword) {
            alert("Please confirm your Password.");
            $("#repwd").val('');
            $("#repwd").focus();
            return false;
        }

        if (Companyname == "") {
            alert("Please enter your Company.");
            $("#companyName").focus();
            return false;
        }

        if (Email == "") {
            alert("Please enter your Email.");
            $("#email").focus();
            return false;
        }

        if (!validateEmail(Email)) {
            alert("Email invalid.");
            $("#email").val('');
            $("#email").focus();
            return false;
        }


        // dang ki
        var dataInfo = "{'Username':'" + Username + "', 'Password':'" + Password + "', 'Companyname':'" + Companyname + "', 'Email':'" + Email + "'}";

        $.ajax({
            type: "POST",
            url: "MasterPage.aspx/XuLiDangKi",
            data: dataInfo,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (html) {
                if (html.d == "-1") {
                    alert("Register error.");
                }
                else if (html.d == "0") {
                    alert("Username already exists.");
                }
                else {
                    document.location = "./Default.aspx";
                }
            }
        });
    });


    $("#quick-search-button").click(function () {
        var loaiTaiLieu = $("select[name*='DropDownList_LoaiTaiLieu'] option:selected").val();

        var moTa = "";
        if (document.getElementById("search-input").value == "" || document.getElementById("search-input").value == "Search Over 30 Million Products")
            moTa = "";
        else
            moTa = document.getElementById("search-input").value;


        document.location = "./ListBook.aspx?id=" + loaiTaiLieu + "&value=" + moTa;
    });
});


function onfocusSearch() {
    document.getElementById("search-input").value = "";
}

function onblurSearch() {
    if (document.getElementById("search-input").value == "")
        document.getElementById("search-input").value = "Search Over 30 Million Products";
}


function changeBackTopOver() {	// 	when mouse out then ...

    var icon = document.getElementById("div_backTop");
    icon.style.opacity = 1;
    icon.filters.alpha.opacity = 100;
}


function changeBackTopOut() {	// 	when mouse over then ....

    var icon = document.getElementById("div_backTop");
    icon.style.opacity = 0.7;
    icon.filters.alpha.opacity = 70;
}


function backTopWindow() { 	// 	back to top window ...

    window.scrollTo(0, 0);

    var icon = document.getElementById("div_backTop");
    icon.style.opacity = 0;
    icon.filters.alpha.opacity = 0;

    return false;
}


setInterval(setIconBackWindow, 700); // 	set time to check hide or show icon back_to_top
function setIconBackWindow() {	//	functin set hide or show icon back_to_top

    var icon = document.getElementById("div_backTop");
    var top = document.documentElement.scrollTop > 0 ? document.documentElement.scrollTop : document.body.scrollTop;

    if (top >= 500) {

        icon.style.opacity = 1;
        icon.filters.alpha.opacity = 100;
    } else {

        icon.style.opacity = 0;
        icon.filters.alpha.opacity = 0;
    }
}