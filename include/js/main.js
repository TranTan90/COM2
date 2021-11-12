var data1 = [];
var data2 = [];
function check(id1, number1) {
    var m = document.getElementById('language').value;
    if (m == 1) {
        var listname = ["khẩn cấp", "phòng y tế", "vứt rác", "luôn đeo thẻ", "dán sticker", "không được phép", "không tự ý", "có giấy phép", "hút thuốc", "cấm uống rượu", "đồ bảo hộ"];
        var x1 = document.getElementById(id1);
        var z1 = x1.value.toLowerCase();
        if (z1 != '') {
            var y1 = listname.includes(z1);
            if (y1 == true && z1 == listname[number1]) {
                check2(z1, 1);
                console.log(data1);
                console.log(data2);
                if (data1.length == 11) {
                    document.getElementById('name2').style.display = 'none';
                    document.getElementById('name1').style.display = 'block';
                }
                else {
                    document.getElementById('name1').style.display = 'none';
                }
            }
            else {
                alert("Nhập sai từ khóa");
            }
        }
        else {
            alert("Không được để trống");
        }
    }
    else {
        var listname1 = ["비상사태", "보건관리실", "버려주시", "방문증", "스티커 부착", "반입이 금지", "반출할 수 없습니다", "안전작업허가", "흡연구역", "음주를 금지합니다", "보호구"];
        var x = document.getElementById(id1);
        var z = x.value.toLowerCase();
        if (z != '') {
            var y = listname1.includes(z);
            if (y == true && z == listname1[number1]) {
                check2(z, 2);
                console.log(data1);
                console.log(data2);
                if (data2.length == 11) {
                    document.getElementById('name2').style.display = 'none';
                    document.getElementById('name1').style.display = 'block';
                }
                else {
                    document.getElementById('name1').style.display = 'none';
                }
            }
            else {
                alert(" 잘못된 키워드를 입력하세요");
            }
        }
        else {
            alert('비워둘 수 없습니다');
        }

    }

}
function check2(a, b) {
    if (b == 1) {
        if (a != '') {
            data1.push(a);

        }
    }
    else {

        if (a != '') {
            data2.push(a);
        }
    }
}