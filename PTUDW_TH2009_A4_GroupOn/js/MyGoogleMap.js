var map;
var vietnam = new google.maps.LatLng(14.058324, 108.277199);
var initLocation;
var browserSupportFlag;
var geocoder;
var marker;
var infowindow;
var latitude;
var longitude;

//ham xu ly khong dinh vi duoc
function handleNoGeolocation(errorFlag) {
    if (errorFlag == true) {
        alert("Dịch vụ định vị địa lý có lỗi!");
        initLocation = vietnam;
    }
    else {
        alert("Trình duyệt không hỗ trợ định vị địa lý!");
        initLocation = vietnam;
    }
    map.setCenter(initLocation);
}

//ham khoi tao ban do
function initialize() {
    var myOptions = {
        zoom: 20,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    map = new google.maps.Map(document.getElementById("map"), myOptions);
    laydanhsachdiadiemnut(map);
    google.maps.event.addListener(map, 'click', function (e) {
        kinhdoelement = document.getElementById("hiddenkinhdo");
        vidoelement = document.getElementById("hiddenvido");
        var positionclick = e.latLng;
        map.setCenter(positionclick);
        marklocation(positionclick, map);
    })
    // Try W3C Geolocation (Preferred)
    if (navigator.geolocation) {
        browserSupportFlag = true;
        navigator.geolocation.getCurrentPosition(function (position) {
            initLocation = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
            map.setCenter(initLocation);
            latitude = position.coords.latitude;
            longitude = position.coords.longitude;
            marklocation(initLocation, map);
        }, function () {
            handleNoGeolocation(browserSupportFlag);
        });
    }

    // Try Google Gears Geolocation
    else if (google.gears) {
        browserSupportFlag = true;
        var geo = google.gears.factory.create('beta.geolocation');
        geo.getCurrentPosition(function (position) {
            initLocation = new google.maps.LatLng(position.latitude, position.longitude);
            map.setCenter(initLocation);
            latitude = position.coords.latitude;
            longitude = position.coords.longitude;
        }, function () {
            handleNoGeolocation(browserSupportFlag);
        });
    }

    // Browser doesn't support Geolocation
    else {
        browserSupportFlag = false;
        handleNoGeolocation(browserSupportFlag);
    }


}
function marklocation1(position, map) {

    if (!marker) {
        marker = new google.maps.Marker({ map: map });
    }
    marker.setPosition(position);
    if (!infowindow) {
        infowindow = new google.maps.InfoWindow();
    }
    var content = "";
    content += "Vĩ độ:" + position.lat() + "</br>";
    content += "Kinh độ:" + position.lng() + "</br></br></br>";
    infowindow.setContent(content);
    infowindow.open(map, marker);
    google.maps.event.addListener(marker, 'click', function () {
        infowindow.open(map, marker);
    });
}
function marklocation(position, map) {

//    if (!marker) {
       var marker = new google.maps.Marker({ map: map });
    //}
    marker.setPosition(position);
   // if (!infowindow) {
     var   infowindow = new google.maps.InfoWindow();
   // }
    var content = "<strong>" + "vị trí được chọn" + "</strong></br>";
    content += "Vĩ độ:" + position.lat() + "</br>";
    content += "Kinh độ:" + position.lng() + "</br></br></br>";

    content += "<form method = 'POST' action = '../Home/themdiadiem'>";
    content += "<label>Tên địa điểm</label>";
    content += "<input type = 'text' id = 'tendiadiem' name = 'tendiadiem' value = 'tên địa điểm'/>";
    content += "<input type = 'button' value = 'thêm' onclick = 'btnthemdiadiemclick()'/>";
    content += "<input type = 'hidden' id = 'hiddenvido' value = '" + position.lat() + "' name = 'vido'/>";
    content += "<input type = 'hidden' id = 'hiddenkinhdo'value = '" + position.lng() + "' name = 'kinhdo'/>";
    content += "</form>";
    infowindow.setContent(content);
    infowindow.open(map, marker);
    google.maps.event.addListener(marker, 'click', function () {
        infowindow.open(map, marker);
    });
}
//Tim dia diem
function findLocation(address, flag) {
    if (!geocoder) {
        geocoder = new google.maps.Geocoder();
    }
    var geocoderRequest = { address: address };
    geocoder.geocode(geocoderRequest, function (results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            if (!marker) {
                marker = new google.maps.Marker({ map: map });
            }
            marker.setPosition(results[0].geometry.location);
            if (!infowindow) {
                infowindow = new google.maps.InfoWindow();
            }
            var content = '<strong>' + results[0].formatted_address + '</strong></br>';
            content += 'Vĩ độ:' + results[0].geometry.location.lat() + '</br>';
            content += 'Kinh độ:' + results[0].geometry.location.lng() + '</br></br></br>';
            infowindow.setContent(content);
            infowindow.open(map, marker);
            if (flag == true) {
                var panel = document.getElementById("diadiempanel");
                var panelContent = "<strong>Các kết quả tìm được:</strong></br>";
                for (var i in results) {
                    panelContent += "<a href='javascript:void(0);' name='" + results[i].formatted_address + "' onclick=linkDiaDiem_Click(this)>" + results[i].formatted_address + "</a>" + "</br></br>";
                }
                panel.innerHTML = panelContent;
            }
            google.maps.event.addListener(marker, 'click', function () {
                infowindow.open(map, marker);
            });
        }
        else {
            alert('Không tìm thấy địa chỉ cần tìm');
        }
    });
}

//ham xu ly su kien button click
function btnDiaDiem_Click() {
    var address = document.getElementById("DiaDiem").value;
    findLocation(address, true);
}

//ham xu ly su kien link click
function linkDiaDiem_Click(link) {
    var DiaDiem = link.name;
    findLocation(DiaDiem, false);
}

//ham xu ly su kien button click
function btnMyLocation_Click() {

    map.setZoom(20);
    var content = 'Vi tri cua ban</br>' + 'Vi do: ' + latitude + '</br> kinh do: ' + longitude;
    var marker = new google.maps.Marker({
        position: initLocation,
        map: map
    });
    // Creating a InfoWindow
    var infoWindow = new google.maps.InfoWindow({
        content: content
    });
    // Adding the InfoWindow to the map
    infoWindow.open(map, marker);

}

// hàm đăng nhập
function btndangnhapclick() {
    var dulieu = {tentruycap: document.getElementById("tentruycap").value,
    matkhau: document.getElementById("matkhau").value
    };
    $.ajax({ url: "../TaiKhoan/dangnhap",
        type: "POST",
        datatype: "json",
        data: dulieu,
        success: function (data) {
            responsedata = JSON.parse(data);
            alert(responsedata.responsetext);
            if (responsedata.trueorfalse == true) {
                oldelement = document.getElementById("dangnhapform");
                var dxel = document.createElement("div");
                dxel.innerHTML = "<a  onclick = 'linkdangxuatclick()'>Đăng xuất</a>";
                dxel.setAttribute("id", "linkdangxuat");
                el = document.getElementById("dangnhapdangxuat");
                // el.replaceChild(newel, oldelement);
                el.removeChild(oldelement);
                el.appendChild(dxel);
                laydanhsachdiadiemnut(map);
            }
        },
        error: function (res) {
            alert(res);
        }
    });
}

// hàm tìm địa điểm
function btntimdiadiemonclick() {

}
// hàm cập nhật địa điem
function btncapnhatdiadiemclick() {

}
// hàm thêm địa điểm

// hàm xóa địa điểm
function btnxoadiadiemclick() {

}
// hàm đăng ký tài khoản
function btndangkytaikhoanclick() {

}
//function lay danh sach dia diem
function laydanhsachdiadiemnut(map) {
    var masodiemnut = document.getElementById("masodiadiemnut").getAttribute("value");
    if (masodiemnut == -1) masodiemnut = null;
    dulieu = { masodiadiemnut: masodiemnut };
    $.ajax({ url: "../Home/laydanhsachdiadiem",
        data: dulieu,
        type: "POST",
        datatype: "json",
        data: dulieu,
        success: function (data) {
            responsedata = JSON.parse(data);
            if (responsedata.trueorfalse == true) {
                alert(responsedata.responsetext);
                hienthidanhsachdiadiem(responsedata.result, map);
            }
            else {
                var text = responsedata.responsetext;
                alert(text);
            }
        },
        error: function (data) {
            alert("lỗi khi lấy danh sách địa điểm");
        }
    });
}
//
function hienthidanhsachdiadiem(dsdd, map) {
    for (var i = 0; i<dsdd.length;++i) {
        placeSavedMarker(dsdd[i]);
    }
}
//
function placeSavedMarker(dd) {

    Location = new google.maps.LatLng(dd.ViDo, dd.KinhDo);

    var marker = new google.maps.Marker({
        position: Location,
        map: map
    });
    var content = "<strong>" + "Thông tin địa điểm" + "</strong></br>";
    content += "Vĩ độ:" + dd.ViDo + "</br>";
    content += "Kinh độ:" + dd.kinhDo + "</br></br></br>";

    content += "<form method = 'POST'>";
    content += "<label>Mã số địa điểm: " + dd.MaSoDiaDiem + "</label><br/>";
    content += "<label>Tên địa điểm</label><br/>";
    content += "<input type = 'text' id = 'tendiadiem' name = 'tendiadiem' value = '" + dd.TenDiaDiem + "'/><br/>";
    content += "<input type = 'text' id = 'txtvido' value = '" + dd.ViDo + "' name = 'vido'/>";
    content += "<input type = 'hidden' id = 'txtkinhdo'value = '" + dd.KinhDo + "' name = 'kinhdo'/>";
    content += "<input type = 'button' value = 'xóa' onclick = 'btnxoadiadiemclick()'/>";
    content += "<input type = 'button' value = 'cập nhật' onclick = 'btncapnhatdiadiemclick()'/>";
    content += "</form>";
    var infoWindow = new google.maps.InfoWindow({
        content: content
    });
    google.maps.event.addListener(marker, 'click', function () {
        infoWindow.open(map, marker);
    });
    infoWindow.close();
}
//

function danhdaudiadiem(dd, map) {

    var position = google.maps.LatLng( dd.ViDo,dd.kinhDo);
    var markerforonlyonce = new google.maps.Marker({ map: map });
    markerforonlyonce.setPosition(position);
    var infowindowdoronlyone = new google.maps.InfoWindow();
   
    var content = "<strong>" + "Thông tin địa điểm" + "</strong></br>";
    content += "Vĩ độ:" + dd.ViDo + "</br>";
    content += "Kinh độ:" + dd.kinhDo + "</br></br></br>";

    content += "<form method = 'POST'>";
    content += "<label>Mã số địa điểm: " +dd.MaSoDiaDiem+ "</label>";
    content += "<label>Tên địa điểm</label>";
    content += "<input type = 'text' id = 'tendiadiem' name = 'tendiadiem' value = '" + dd.TenDiaDiem + "'/>";
    content += "<input type = 'text' id = 'txtvido' value = '" + dd.ViDo + "' name = 'vido'/>";
    content += "<input type = 'hidden' id = 'txtkinhdo'value = '" + dd.kinhDo + "' name = 'kinhdo'/>";
    content += "<input type = 'button' value = 'xóa' onclick = 'btnxoadiadiemclick()'/>";
    content += "<input type = 'button' value = 'cập nhật' onclick = 'btncapnhatdiadiemclick()'/>";
    content += "</form>";
    infowindowdoronlyone.setContent(content);
    infowindowdoronlyone.open(map, markerforonlyonce);
    google.maps.event.addListener(markerforonlyonce, 'click', function () {
        infowindowdoronlyone.open(map, markerforonlyonce);
    });
}
// hàm thêm địa điểm
function btnthemdiadiemclick() {
    var dulieu = { 
        tendiadiem: document.getElementById("tendiadiem").value,
        kinhdo: document.getElementById("hiddenkinhdo").getAttribute("value"),
        vido: document.getElementById("hiddenvido").getAttribute("value")
         };
         $.ajax({ url: "../Home/themdiadiem",
             data: dulieu,
             type: "POST",
             datatype: "json",
             data: dulieu,
             success: function (data) {
                 responsedata = JSON.parse(data); 
                 if (responsedata.trueorfalse == true)
                     alert(responsedata.responsetext);
                 else {
                     var text = data.responsetext;
                     alert(text);
                 }
             },
             error: function (data) {
                 alert("thêm thất bại");
             }
         });
}

function linkdangxuatclick() {

    $.ajax({ url: "../TaiKhoan/dangxuat",
        type: "POST",
        datatype: "json",
        success: function (data) {
            responsedata = JSON.parse(data);
            if (responsedata == true) {
                alert("đăng xuất thành công");
            }
            else {
                alert("đăng xuất thất bại");
            }
            oldelement = document.getElementById("linkdangxuat");
            var dxel = document.createElement("form");
            dxel.innerHTML = "<label>tên truy cập</label><br /><input id  = 'tentruycap' name = 'tentruycap' value = 'tentruycap'/><br /><label>mật khẩu</label><br /><input id = 'matkhau' name = 'matkhau' type ='password' value = 'matkhau'/><br /><input type = 'button' name = 'btndangnhap' value = 'đăng nhập' onclick = 'btndangnhapclick()'/>";
            dxel.setAttribute("id", "dangnhapform");
            el = document.getElementById("dangnhapdangxuat");
            // el.replaceChild(newel, oldelement);
            el.removeChild(oldelement);
            el.appendChild(dxel);
        },
        error: function (data) {
            alert("lỗi");
        }
    });
}