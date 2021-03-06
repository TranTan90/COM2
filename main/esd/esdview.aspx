<%@ Page Language="C#" AutoEventWireup="true" CodeFile="esdview.aspx.cs" Inherits="esdview" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
    integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
    crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.js" integrity="sha512-n/4gHW3atM3QqRcbCn6ewmpxcLAHGaDjpEBu4xZd47N0W2oQ+6q7oc3PXstrJYXcbNU1OHdQ1T7pAP+gi5Yu8g=="
    crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="../../include/js/main.js">
</script>
<script type="text/javascript">
    $(document).ready(function () {
        $('.langkr').hide();
        $('#language').on('change', function () {
            var getlang = $('#language').val();
            if (getlang == 1) {
                $('.langkr').hide();
                $('.langvn').show();
            }
            else {
                $('.langkr').show();
                $('.langvn').hide();
            }
        });
    });
    window.onload = function () {
        alert('Vui lòng nhập đầy đủ  vào các ô theo các từ gợi ý có sẵn / 사용 가능한 제안된 단어에 따라 모든 상자를 채우십시오.')

    };

</script>
<style type="text/css">
    
    .note
    {
       display: flex;
       justify-content: center;
       height: 100%;
    }

 .view1
   {
     background-color:;
      border: 2px solid Gray;
      border-radius:15px;
   }
   
 .viewicon 
 
     {
          margin-left:25px;
          width:"70px"; 
    }
    
    
    .imglocal
    {
            width:60%;
         margin-left:300px;
    }
    
    #name1
    {
        display:none;
     }
     
     
</style>
<body>
    <div style="float: right; margin: 20px"  ;>
        <label > Language :</label>
        <select id="language" >
            <option value="1">VIET NAM</option>
            <option value="2">KOREA</option>
        </select>
    </div>
    <form id="form1" runat="server" class="note">
    <div class="">
        <div style="height: 10px">
        </div>
        <div>
            <img src="../../images/logo1.png" style="float: left; width: 130px" />
            <div style="font-size: 30px; font-weight: bolder; margin-left: 250px">
                <div class="langkr" style="margin-left: 250px">
                    내방객 기초 준수 사항
                </div>
                <div class="langvn">
                    HẠNG MỤC CƠ BẢN CẦN TUÂN THỦ CỦA KHÁCH ĐẾN THĂM
                </div>
            </div>
        </div>
        <div style="height: 20px">
        </div>
        <div style="margin-top: 30px; margin-left: 200px; font-size: 30px; font-weight: bolder">
            <div class="langkr" style="margin-left: 280px">
                비상 사태시 집결지 안내
            </div>
            <div class="langvn">
                HƯỚNG DẪN NƠI TẬP KẾT KHI XẢY RA TÌNH HUỐNG KHẨN CẤP
            </div>
        </div>
        <div class="view1">
            <div style="height: 30px">
            </div>
            <img src="../../images/esd/fatory.PNG" alt="" class="imglocal"><br />
            <div style="height: 20px">
            </div>
            <div>
                <table>
                    <tr>
                        <td style="width: 180px; height: 100px">
                            <img src="../../images/esd/icon1.png" width="85px" style="margin-left: 35px" />
                        </td>
                        <td>
                            <div class="langkr">
                                <input type="text" placeholder="비상사태" style="width: 80px; border: 1px solid black"
                                    id="texname50" onchange="check('texname50',0)" />
                                발생시 비상대피로를 확인하여 대피하고 집결지로 집합합니다.
                            </div>
                            <div class="langvn">
                                Khi xảy ra tình huống
                                <input type="text" placeholder="khẩn cấp" style="width: 80px; border: 1px solid black"
                                    id="texname0" onchange="check('texname0',0)" />, cần xác định đường lánh nạn
                                khẩn cấp và tập trung tại điểm tập kết
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <div>
                <table>
                    <tr>
                        <td style="width: 180px; height: 100px">
                            <img src="../../images/esd/icon3.png" width="85px" style="margin-left: 35px" />
                        </td>
                        <td>
                            <div class="langkr">
                                응급조치, 갑작스런 건강 이상시 식당 옆
                                <input type="text" placeholder="보건관리실" style="width: 100px; border: 1px solid black"
                                    id="texname51" onchange="check('texname51',1)" />
                                을 방문하여 주세요.
                            </div>
                            <div class="langvn">
                                Vui lòng đến
                                <input type="text" placeholder="Phòng y tế" style="width: 90px; border: 1px solid black"
                                    id="texname1" onchange="check('texname1',1)" />
                                (cạnh nhà ăn) nếu cần cấp cứu hoặc có dấu hiệu sức khỏe bất thường.
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <div>
                <table>
                    <tr>
                        <td style="width: 180px; height: 100px">
                            <img src="../../images/esd/icon2.png" width="85px" style="margin-left: 35px" />
                        </td>
                        <td>
                            <div class="langkr">
                                폐기물은 지정된 장소에
                                <input type="text" placeholder="버려주시" style="width: 80px; border: 1px solid black"
                                    id="texname52" onchange="check('texname52',2)" />고 분류에 따라 폐기해야 합니다.
                            </div>
                            <div class="langvn">
                                Vui lòng <input type="text" placeholder="vứt rác" style="width: 60px; border: 1px solid black"
                                    id="texname2" onchange="check('texname2',2)" />thải tại nơi quy định và cần
                                vứt bỏ theo phân loại.
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <div>
                <table>
                    <tr>
                        <td style="width: 180px; height: 100px">
                            <img src="../../images/esd/icon4.png" width="70px" style="margin-left: 35px" />
                        </td>
                        <td>
                            <div class="langkr">
                                내방수칙 위반으로 시정 요구를 받을 경우 향후 출입이 제한될 수 있습니다.
                            </div>
                            <div class="langvn">
                                Có thể hạn chế ra vào sau này trong trường hợp nhận được yêu cầu sửa đổi quyền ra
                                vào do vi phạm nội quy khách đến thăm.
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <div>
                <table>
                    <tr>
                        <td style="width: 180px; height: 100px">
                            <img src="../../images/esd/icon5.png" width="85px" style="margin-left: 35px" />
                        </td>
                        <td>
                            <div class="langkr">
                                사내 이동 시에는 전방을 주시하고, 돌출된 구역이 있는지 확인합니다.
                            </div>
                            <div class="langvn">
                                Khi di chuyển trong công ty, lưu ý phía trước và kiểm tra xem có vật/khu vực bị
                                nhô ra không.
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <div>
                <table>
                    <tr>
                        <td style="width: 180px; height: 100px">
                            <img src="../../images/esd/icon6.png" width="80px" style="margin-left: 35px" />
                        </td>
                        <td>
                            <div class="langkr">
                                계단 이동 시에는 난간을 사용하고, 천천히 한 계단씩 이동합니다.
                            </div>
                            <div class="langvn">
                                Khi di chuyển trên cầu thang, sử dụng tay vịn, di chuyển từng bậc chậm rãi.
                            </div>
                        </td>
                    </tr>
                </table>
                <div style="height: 30px">
                </div>
            </div>
        </div>
        <div style="height: 20px">
        </div>
        <div>
            <div style="text-align: center; margin-top: 80px; font-size: 30px; font-weight: bolder">
                <div class="langkr">
                    보안 준수 사항
                </div>
                <div class="langvn">
                    HẠNG MỤC BẢO AN CẦN TUÂN THỦ
                </div>
            </div>
            <div class="view1">
                <div style="height: 30px">
                </div>
                <div>
                    <table>
                        <tr>
                            <td style="width: 180px; height: 100px">
                                <img src="../../images/esd/icon7.png" style="margin-left: 35px; width: 65px" />
                            </td>
                            <td>
                                <div class="langkr">
                                    사내에서 항시
                                    <input type="text" placeholder="방문증" style="width: 70px; border: 1px solid black"
                                        id="texname53" onchange="check('texname53',3);" />
                                    을 패용하여 주십시오.
                                </div>
                                <div class="langvn">
                                    <input type="text" placeholder="Luôn Đeo Thẻ" style="width: 120px; border: 1px solid black"
                                        id="texname3" onchange="check('texname3',3);" />
                                    khách trong công ty.
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
                <div>
                    <table>
                        <tr>
                            <td style="width: 180px; height: 100px">
                                <img src="../../images/esd/icon8.png" style="margin-left: 35px; width: 65px" />
                            </td>
                            <td>
                                <div class="langkr">
                                    사내에서 이동 시에는 반드시 당사 직원과 동행해야 합니다.
                                </div>
                                <div class="langvn">
                                    Khi di chuyển trong công ty, phải luôn đi cùng nhân viên công ty
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
                <div>
                    <table>
                        <tr>
                            <td style="width: 180px; height: 100px">
                                <img src="../../images/esd/icon9.png" width="60px" style="margin-left: 35px" />
                            </td>
                            <td>
                                <div class="langkr">
                                    휴대폰 봉인
                                    <input type="text" placeholder="스티커 부착" style="width: 100px; border: 1px solid black"
                                        id="texname54" onchange="check('texname54',4)" />
                                    부착에 협조하여 주십시오.
                                </div>
                                <div class="langvn">
                                    Hợp tác khi được yêu cầu
                                    <input type="text" placeholder="dán sticker" style="width: 90px; border: 1px solid black"
                                        id="texname4" onchange="check('texname4',4)" />
                                    camera điện thoại
                                </div>
                                <br />
                            </td>
                        </tr>
                    </table>
                </div>
                <div>
                    <table>
                        <tr>
                            <td style="width: 180px; height: 100px">
                                <img src="../../images/esd/icon10.png" width="85px" style="margin-left: 35px" />
                            </td>
                            <td>
                                <div class="langkr">
                                    출문시 차량/소지품 검사에 협조하여 주십시오.
                                </div>
                                <div class="langvn">
                                    Hợp tác khi có yêu cầu kiểm tra xe/hành lý khi ra cổng
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
                <div>
                    <table>
                        <tr>
                            <td style="width: 180px; height: 100px">
                                <img src="../../images/esd/icon11.PNG" width="100px" height="100px" style="margin-left: 25px" />
                            </td>
                            <td>
                                <div class="langkr">
                                    저장 및 촬영매체는
                                    <input type="text" placeholder="반입이 금지" style="width: 100px; border: 1px solid black"
                                        id="texname55" onchange="  check('texname55',5)" />
                                    되어 있습니다. 보안실에 보관하여 주시기 바랍니다.
                                </div>
                                <div class="langvn">
                                    <input type="text" placeholder="Không Được Phép" style="width: 140px; border: 1px solid black"
                                        id="texname5" onchange="  check('texname5',5)" />
                                    mang thiết bị quay phim chụp ảnh hoặc lưu trữ vào công ty. Vui lòng bảo quản tại
                                    Phòng bảo vệ.
                                </div>
                                <br />
                            </td>
                        </tr>
                    </table>
                </div>
                <div>
                    <table>
                        <tr>
                            <td style="width: 180px; height: 100px">
                                <img src="../../images/esd/icon12.PNG" width="100px" height="100px" style="margin-left: 25px" />
                            </td>
                            <td>
                                <div class="langkr">
                                    사내 물품을 임의
                                    <input type="text" placeholder="반출할 수 없습니다" style="width: 150px; border: 1px solid black"
                                        id="texname56" onchange="check('texname56',6)" />.사전에 반출신고를 진행해야 합니다.
                                </div>
                                <div class="langvn">
                                    <input type="text" placeholder="Không Tự ý" style="width: 100px; border: 1px solid black"
                                        id="texname6" onchange="check('texname6',6)" />
                                    mang đồ ra ngoài công ty. Cần phải khai báo trước.
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
                <div style="margin-top: 15px; text-align: center;">
                    <img src="../../images/esd/icon13.JPG" alt="" height="" style="margin: 10px"><br />
                </div>
                <div style="height: 30px">
                </div>
            </div>
        </div>
        <div style="height: 30px">
        </div>
        <div>
            <h3 style="text-align: center; margin-top: 40px; font-weight: bolder">
                <div class="langkr">
                    안전보건 준수 사항
                </div>
                <div class="langvn">
                    HẠNG MỤC AN TOÀN SỨC KHỎE CẦN TUÂN THỦ
                </div>
            </h3>
            <div class="view1">
                <div style="height: 20px">
                </div>
                <div>
                    <table>
                        <tr>
                            <td style="width: 180px; height: 100px">
                                <img src="../../images/esd/icon14.png" style="margin-left: 40px; width: 65px" />
                            </td>
                            <td>
                                <div class="langkr">
                                    작업 전에는
                                    <input type="text" placeholder="안전작업허가" style="width: 120px; border: 1px solid black"
                                        id="texname57" onchange="  check('texname57',7)" />
                                    를 받아야 합니다.
                                </div>
                                <div class="langvn">
                                    Trước khi tiến hành công việc, phải
                                    <input type="text" placeholder="Có giấy phép" style="width: 100px; border: 1px solid black"
                                        id="texname7" onchange="  check('texname7',7)" />
                                    làm việc an toàn
                                </div>
                                <br />
                            </td>
                        </tr>
                    </table>
                </div>
                <div>
                    <table>
                        <tr>
                            <td style="width: 180px; height: 100px">
                                <img src="../../images/esd/icon15.png" style="margin-left: 35px; width: 80px" />
                            </td>
                            <td>
                                <div class="langkr">
                                    차량 운행 속도는 20KM/H이하이며, 운전, 보행 중 휴대폰 사용을 금지합니다.
                                </div>
                                <div class="langvn">
                                    Tốc độ lái xe dưới 20KM/H, không dùng điện thoại trong khi đang lái xe hoặc đi bộ.
                                </div>
                                <br />
                            </td>
                        </tr>
                    </table>
                </div>
                <div>
                    <table>
                        <tr>
                            <td style="width: 180px; height: 100px">
                                <img src="../../images/esd/icon16.png" width="80px" style="margin-left: 35px" />
                            </td>
                            <td>
                                <div class="langkr">
                                    지정된
                                    <input type="text" placeholder="흡연구역" style="width: 80px; border: 1px solid black"
                                        id="texname58" onchange="check('texname58',8)" />
                                    외에는 모든 구역이 금연구역 입니다.
                                </div>
                                <div class="langvn">
                                    Ngoại trừ khu vực
                                    <input type="text" placeholder="Hút thuốc" style="width: 90px; border: 1px solid black"
                                        id="texname8" onchange="check('texname8',8)" />
                                    được chỉ định, tất cả các khu vực đều cấm hút thuốc
                                </div>
                                <br />
                            </td>
                        </tr>
                    </table>
                </div>
                <div>
                    <table>
                        <tr>
                            <td style="width: 180px; height: 100px">
                                <img src="../../images/esd/icon17.png" width="80px" style="margin-left: 35px" />
                            </td>
                            <td>
                                <div class="langkr">
                                    운전 또는 작업 중에
                                    <input type="text" placeholder="음주를 금지합니다." style="width: 150px; border: 1px solid black"
                                        id="texname59" onchange="check('texname59',9)" />
                                </div>
                                <div class="langvn">
                                    <input type="text" placeholder="Cấm Uống rượu" style="width: 130px; border: 1px solid black"
                                        id="texname9" onchange="  check('texname9',9)" />trong khi làm việc hoặc lái
                                    xe
                                </div>
                                <br />
                            </td>
                        </tr>
                    </table>
                </div>
                <div>
                    <table>
                        <tr>
                            <td style="width: 180px; height: 100px">
                                <img src="../../images/esd/icon18.png" width="70px" style="margin-left: 35px" />
                            </td>
                            <td>
                                <div class="langkr">
                                    보수 작업 또는 건축 작업 등 작업 현장 내 출입시 안전
                                    <input type="text" placeholder="보호구" style="width: 60px; border: 1px solid black"
                                        id="texname60" onchange="  check('texname60',10)" />를 반드시 착용해야 합니다.
                                </div>
                                <div class="langvn">
                                    Trường hợp xây dựng hoặc sửa chữa, khi ra vào nơi làm việc phải mặc
                                    <input type="text" placeholder="Đồ bảo hộ" style="width: 100px; border: 1px solid black"
                                        id="texname10" onchange="  check('texname10',10)" />an toàn
                                </div>
                                <br />
                            </td>
                        </tr>
                    </table>
                </div>
                <div>
                    <table>
                        <tr>
                            <td style="width: 180px; height: 100px">
                                <img src="../../images/esd/icon19.png" width="85px" style="margin-left: 35px" />
                            </td>
                            <td>
                                <div class="langkr">
                                    중장비가 작업하는 구역 아래는 이동을 금지합니다.
                                </div>
                                <div class="langvn">
                                    Không di chuyển dưới khu vực đang thực hiện công việc với thiết bị nặng.
                                </div>
                                <br />
                            </td>
                        </tr>
                    </table>
                </div>
                <div style="height: 30px">
                </div>
            </div>
        </div>
        <div style="height: 40px">
        </div>
        <div>
            <div class="langkr">
                위반 사항이 발견될 경우 업무 중이라도 강제 출문될 수 있습니다.
            </div>
            <div class="langvn">
                Trường hợp phát hiện vi phạm, có thể bị cưỡng chế ra khỏi công ty dù đang làm việc.
            </div>
            <br />
            <div class="langkr">
                다시 한번 내방객 여러분의 건강과 안전을 위하여 안전/보안 담당자의 지시에 성실히 따라 주시기를 부탁드립니다
            </div>
            <div class="langvn">
                Vì sự an toàn và sức khỏe của khách đến thăm, một lần nữa, vui lòng tuân thủ những
                yêu cầu của người phụ trách an toàn/bảo an
            </div>
            <br />
            <div class="langkr">
                하나마이크론 비나는 내방객 여러분의 안전을 보장하고, 사내 정보 자산을 보호하기 위하여 많은 노력을 하고 있습니다
            </div>
            <div class="langvn">
                Công ty TNHH Hana Micron vina đang nỗ lực hết mình để bảo đảm an toàn cho các vị
                khách đến thăm cũng như bảo vệ tài sản, thông tin nội bộ của công ty
            </div>
            <br />
            <div class="langkr">
                내방객 여러분들은 아래의 사항을 준수해야 하며 문제 사항이 발견될 경우 사내 담당자에게 내용을 즉시 전달해야 합니다
            </div>
            <div class="langvn">
                Khách đến thăm cần tuân thủ các hạng mục sau, khi phát sinh vấn đề cần thông báo
                ngay nội dung cho người phụ trách trong công ty.
            </div>
        </div>
        <br />
        <br />
        <asp:CheckBox ID="CheckBox1" runat="server" Text="<span style='color:Blue'> Tôi sẽ tuân thủ các hạng mục trên, và xin chịu bất kỳ hình phạt nào nếu có hành vi vi phạm quy định </span><br/>(본인은 상기 사항을 준수할 것이며, 규정에 위반되는 행위를 할 경우 어떠한 처벌도 감수하겠습니다)"
            OnCheckedChanged="CheckBox1_CheckedChanged"></asp:CheckBox>
        <asp:Button runat="server" ID="name1" Text="Đồng Ý/ 동의" OnClick="name1_Click" Style="float: right;
            margin-left: 20px" CssClass="btn btn-primary" />
        <input type="button" id="name2" value="Đồng Ý/ 동의" style="float: right; margin-left: 20px"
            class="btn btn-secondary" />
        <asp:Button ID="Button1" runat="server" Text="Quay Lại/뒤" OnClick="Unnamed1_Click"
            CssClass="btn btn-primary" Style="float: right" /><div>
            
                <b class="langvn">Khách Thăm:</b>
             <b class="langkr">내방객 : </b>   
                <asp:Label ID="showname" runat="server" Font-Size="20px" Font-Bold ForeColor=""></asp:Label><br />
            </div>
    </form>
    <div style="height: 200px">
    </div>
</body>
</html>
