<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="inputTakeOut.aspx.cs" Inherits="main_takeOut_inputTakeOut" Title="Đăng ký tài sản ra cổng (반출 신청)" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script language="javascript" type="text/javascript" src="../../include/js/calendar.j_"></script>
    <script language="javascript" type="text/javascript" src="../../include/js/default.js"></script>
    <script type="text/javascript" src="../../include/Calender/js/jsCalendar.js"></script>
    <script type="text/javascript" src="../../include/Calender/js/jsCalendar.datepicker.js"></script>
    <script language="javascript" type="text/javascript">
// ajax ready?
var request = false;
try {
	request = new XMLHttpRequest();
} catch (trymicrosoft) {
	try {
		request = new ActiveXObject("Msxml2.XMLHTTP");
	} catch (othermicrosoft) {
		try {
			request = new ActiveXObject("Microsoft.XMLHTTP");
		} catch (failed) {
			request = false;
		}
	}
}
if (!request) alert("Error initializing XMLHttpRequest!");

// 대분류 select box 임시 저장 lưu tạm thời loại lớn select box
var eventTmpObj;

// ajax request send
function getSubCategory(parentCategoryObj){
	var takeOutItemCategoryCode=parentCategoryObj.value;

	// temp 에 담기
	eventTmpObj=parentCategoryObj;
	
	// sub category select box 찾기 tìm sub category select box
	var subSelectBox=eventTmpObj.parentElement.parentElement.cells[3].children[0]; // subCategory select box
	
	// sub category 초기화 khởi tạo sub category
	subSelectBox.length=1;
	subSelectBox.selectedIndex=0;
	subSelectBox.options[0].text='Hãy chọn tài sản lớn trước (대분류를 먼저 선택 하십시오)';
	
	// 대분류의 선택 code 가 있다면 nếu có lựa chọn code của phận loại chính
	// alert(takeOutItemCategoryCode);
	if(takeOutItemCategoryCode){
		var url="searchSubCategory.aspx?takeOutItemCategoryCode="+takeOutItemCategoryCode;
		//alert(url);
		request.open("GET",url,false);
		request.onreadystatechange = updateCategory; // call back method
		request.send(null);
	}
}

// call back method
function updateCategory(){
	if(request.readyState == 4){
		if(request.status== 200){
			var response = request.responseText.split(":|:");
			var subSelectBox=eventTmpObj.parentElement.parentElement.cells[3].children[0]; // subCategory select box
			
			for(var i=0;i<response.length;i++){
				if(response[i]){
					var arrCategory=response[i].split("||");
					
					var newOption=new Option;
					newOption.value=arrCategory[1];
					newOption.text=arrCategory[0];
					
					subSelectBox.options[i]=newOption;
					//alert();
				}
			}
		}else if(request.status == 404){
			alert("request url does not exist!");
		}else{
			alert("status code is = " + request.status);
		}
	}
}


var no=1;
var displayCellCount=<%=displayCellCount%>;
var defaultCellCount=3;

// 업체 검색 완료 hoàn thành tìm kiếm công ty
function addNameID(companyName,companyCode){
	document.forms[0].companyName.value=companyName;
	document.forms[0].companyCode.value=companyCode;
}

// select box 배열들 select box array
var arrItemCategoryNameList=new Array();
var arrItemCategoryCodeList=new Array();
var arrUnitNameList=new Array();
var arrUnitCodeList=new Array();

// 대분류 코드 리스트 list code tài sản lớn
<%=itemCategoryCodeList%>

// 대분류 이름 리스트 list name tài sản lớn
<%=itemCategoryNameList%>

// 단위 코드 리스트 list code unit
<%=unitCodeList%>

// 단위 이름 리스트 list name unit
<%=unitNameList%>

// 물품 추가 thêm tài sản
function insertRow(){
	var target=document.getElementById("takeOutItemList");
	
	if(target.rows.length > 10){
	    alert("Có thể đăng ký tối đa 10 hạng mục (항목은 최대 10개 까지 등록 가능 합니다).");
	    return;
	}
	
	var newRow = target.insertRow(target.rows.length);
	newRow.setAttribute("align","center");

	// hidden code
	var newCell = newRow.insertCell(0);
	newCell.innerHTML=no;
	var tag=document.createElement("input");
	tag.setAttribute('name','takeOutItemCategoryCode');
	tag.setAttribute('type','hidden');
	newCell.appendChild(tag);
	
	// checkbox
	var newCell = newRow.insertCell(1);
	var tag=document.createElement("input");
	tag.setAttribute('name','chk');
	tag.setAttribute('type','checkbox');
	newCell.appendChild(tag);
	
	// 대분류 tài sản lớn
	newCell = newRow.insertCell(2);
	var tag=document.createElement("select");
	tag.setAttribute('name','itemCategory');
	tag.setAttribute('onChange','javascript:getSubCategory(this)');
	//tag.style.setAttribute('width','170px');
    tag.style.width ='150px';
	newCell.appendChild(tag);
	newCell.innerHTML+="";
	
	// 최초 초기 값 보여주기 xem giá trị đầu tiên
	//newCell.children(0).length=arrItemCategoryCodeList.length+1;
    newCell.children[0].length=arrItemCategoryCodeList.length+1;
	var newOption=new Option;
	newOption.text="Chọn tài sản lớn (대분류를 선택 하십시오)";
	//newCell.children(0).options[0]=newOption;
	newCell.children[0].options[0]=newOption;

	for(var i=0;i<arrItemCategoryCodeList.length;i++){
		var newOption=new Option;
		newOption.value=arrItemCategoryCodeList[i];
		newOption.text=arrItemCategoryNameList[i];
		//newCell.children(0).options[i+1]=newOption;
        newCell.children[0].options[i+1]=newOption;
	}
	
	// 중분류 tài sản trung bình
	newCell = newRow.insertCell(3);
	var tag=document.createElement("select");
	tag.setAttribute('name','subCategory');
	//tag.style.setAttribute('width','190px');
    tag.style.width ='185px';
	newCell.appendChild(tag);
	newCell.innerHTML+="";
	
	// 최초 초기 값 보여주기
	var newOption=new Option;
	newOption.text="Hãy chọn tài sản lớn trước (대분류를 먼저 선택 하십시오)";
	newCell.children[0].options[0]=newOption;
	
	// 상품명 tên sản phẩm
	newCell = newRow.insertCell(4);
	var tag=document.createElement("input");
	tag.setAttribute('name','takeOutItemName');
	tag.setAttribute('type','text');
	tag.setAttribute('class','input');
	tag.setAttribute('size','30');
	newCell.appendChild(tag);
	newCell.innerHTML+="";
	
	// 규격 quy cách/ tiêu chuẩn
	newCell = newRow.insertCell(5);
	var tag=document.createElement("input");
	tag.setAttribute('name','takeOutItemType');
	tag.setAttribute('type','text');
	tag.setAttribute('class','input');
	tag.setAttribute('size','30');
	newCell.appendChild(tag);
	newCell.innerHTML+="";
	
	// 수량 số lượng
	newCell = newRow.insertCell(6);
	var tag=document.createElement("input");
	tag.setAttribute('name','account');
	tag.setAttribute('type','text');
	tag.setAttribute('class','input');
	tag.setAttribute('size','10');
	//tag.style.setAttribute('ime-mode','disabled');
    tag.setAttribute('type', 'tel');
	tag.setAttribute('onkeyPress','if ((event.keyCode<48) || (event.keyCode>57)) event.returnValue=false;');
	newCell.appendChild(tag);
	newCell.innerHTML+="";
	
	// 단위 unit
	newCell = newRow.insertCell(7);
	var tag=document.createElement("select");
	tag.setAttribute('name','unit');
	newCell.appendChild(tag);

	newCell.children[0].length=arrUnitCodeList.length;
	for(var i=0;i<arrUnitCodeList.length;i++){
		var newOption=new Option;
		newOption.value=arrUnitCodeList[i];
		newOption.text=arrUnitNameList[i];
		
		newCell.children[0].options[i]=newOption;
	}
	no++;
}

// 선택 삭제 lựa chọn xóa
function deleteRow(){
	var target=document.getElementById("takeOutItemList");
	for(var io=target.rows.length-1;io > 0;io--){
		if(target.rows[io].cells[1].children[0].checked){
			target.deleteRow(io);	
		}
	}
}


// 임직원 검색 완료 hoàn thành tim kiếm nhân viên
function endSearchEmployee(upnid,displayName){
	
	var f=document.forms[0];
	var txtDisplayNameBox=f.displayName;
	var hiddenUpnidBox=f.upnid;
	
	txtDisplayNameBox.value=displayName;
	hiddenUpnidBox.value=upnid;
}

// 차량 검색 완료 hoàn thành tìm kiếm ô tô
function endSearchCar(carCode,number){
	var f=document.forms[0];
	
	f.carCode.value=carCode;
	f.carNumber.value=number;
}

// 입력 검사 & 결재선 새창 nhập tìm kiếm &  cửa sổ phê duyệt mới
function approveChoice(){
    var f=document.forms[0];
    
	if(checkForm(document.forms[0])){
//		newWinByName('../approve/inputApprove.aspx?isTakeOut=1','approveInput',300,100);

	// 저장해서 submit lưu sau đó submit
	    var target=document.getElementById("takeOutItemList");
	    for(var i=1;i<target.rows.length;i++){
		    if(target.rows[i].cells[2].children[0].value && target.rows[i].cells[3].children[0].value && target.rows[i].cells[4].children[0].value){
			    f.parentTakeOutItemCategoryCodes.value+=target.rows[i].cells[2].children[0].value+",";
			    f.subTakeOutItemCategoryCodes.value+=target.rows[i].cells[3].children[0].value+",";
			    f.takeOutItemNames.value+=target.rows[i].cells[4].children[0].value+",";
			    f.takeOutItemNameTypes.value+=target.rows[i].cells[5].children[0].value+",";
			    f.takeOutItemAccounts.value+=target.rows[i].cells[6].children[0].value+",";
			    f.takeOutUnits.value+=target.rows[i].cells[7].children[0].value+",";
		    }
	    }
		f.submit();
	}
}

// 결재선 지정 완료 & submit hoàn thành chỉ định phê duyệt <-----------------------------------------------------------------------
//function approveChoiceEnd(approveUserCode){
//	var f=document.forms[0];
//	f.approvalUserCode.value=approveUserCode;
//	
//	// 저장해서 submit
//	var target=document.getElementById("takeOutItemList");
//	for(var i=1;i<target.rows.length;i++){
//		if(target.rows[i].cells[2].children[0].value && target.rows[i].cells[3].children[0].value && target.rows[i].cells[4].children[0].value){
//			f.parentTakeOutItemCategoryCodes.value+=target.rows[i].cells[2].children[0].value+",";
//			f.subTakeOutItemCategoryCodes.value+=target.rows[i].cells[3].children[0].value+",";
//			f.takeOutItemNames.value+=target.rows[i].cells[4].children[0].value+",";
//			f.takeOutItemNameTypes.value+=target.rows[i].cells[5].children[0].value+",";
//			f.takeOutItemAccounts.value+=target.rows[i].cells[6].children[0].value+",";
//			f.takeOutUnits.value+=target.rows[i].cells[7].children[0].value+",";
//		}
//	}
//	f.submit();
//}

// 입력 검사 nhập tìm kiếm
function checkForm(f){

    if(!f.scheduleOutDate.value){
	    alert('Hãy nhập ngày dự định tài sản ra cổng (반출 예정일을 입력하여 주십시오)');
		return false;
	}
	
	// 반입 필 yêu cầu khi ra cổng
	if(f.requireIN[0].checked==true){
		if(!f.scheduleInDate.value){
			alert('Hãy nhập ngày dự định tài sản vào (반입 예정일을 입력하여 주십시오)');
			 return false;		
		}
        if(f.scheduleOutDate.value > f.scheduleInDate.value){
	        alert('Ngày mang tài sản vào không thể trước ngày mang tài sản ra (반입일이 반출일 이전일 수 없습니다)');	        
	        return false;
		}
		
		// 2016-03-16-임종우 : 반입일 90일 까지 제한 (CRC, 총무 요청) Giới hạn ngày mang tài sản vào đến 90 ngày (CRC, yêu cầu GA)
		var dateinfo = f.scheduleOutDate.value.split("-");
		var src = new Date(dateinfo[0], dateinfo[1]-1, dateinfo[2]); // 월은 0부터 시작하므로 -1을 해줘야한다. 
		src.setDate(src.getDate() + 90); // 90일을 더한다.
		
		// 2018-03-28-임종우 : 기존 년도 가져오는 getYear() 가 버그로 인해 Web표준에서 제거 됨. 신규 Function 으로 변경 함.
        // 
		var year = src.getFullYear();
		//var year = src.getYear();
		var month = src.getMonth() + 1;
		var date = src.getDate();
		
		if (month < 10) month = "0" + month;
		if (date < 10) date = "0" + date;
		var result = year + "-" + month + "-" + date;
		
		if(result < f.scheduleInDate.value){
	        alert('Ngày dự định mang tài sản vào không thể vượt quá 90 ngày (반입예정일이 90일을 초과 할 수 없습니다).');	        
	        return false;
		}
		
	}else{
		if(!f.disApprovalCategoryDetail.value){
			alert('Lý do chi tiết không thể mang tài sản vào công ty (반입 불가 세부 사유를 입력하여 주십시오)');
			return false;
		}
	}
	
	if(f.<%=takeOutObjectCode.ClientID%>.selectedIndex == 0){
        alert('Hãy chọn mục đích mang tài sản ra cổng (반출 목적을 선택하여 주십시오)');
        return false;
    }
    
	if(!f.objectContents.value){
		alert('Chi tiết mục đích mang tài sản ra cổng (반출 세부 목적을 입력하여 주십시오)');
		f.objectContents.focus();
		return false;
	}	
	
	if(!f.companyName.value){
		alert('Địa điểm mang tài sản ra (반출처를 입력하여 주십시오)');
		f.companyName.focus();
		return false;
	}
	
	if(!f.recieveName.value){
		alert('Nhập tên người nhận (수령자를 입력하여 주십시오)');
		f.recieveName.focus();
		return false;
	}		



	// 반출 물품 분류 선택 여부 chọn loại tài sản ra ngoài
	var tf=false;
	var target=document.getElementById("takeOutItemList");
	for(var io=target.rows.length-1;io > 0;io--){
		var row=target.rows[io];
		if(row.cells[2].children[0].value){
			if(!row.cells[3].children[0].value) tf=false; 
			else if(!row.cells[4].children[0].value) tf=false; 
			else if(!row.cells[5].children[0].value) tf=false; 
			else if(!row.cells[6].children[0].value) tf=false; 
			else tf=true;
		}
	}
	
	if(!tf){
		alert('Hãy nhập thông tin vật phẩm mang ra cổng (반출 물품의 정보를 입력하여 주십시오)');
		//f.visitObjectContents.focus();
		return false;
	}
	
	
	return true;
}


// check tep file
    </script>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td>
                <!--################################ 타이틀, 현재위치 시작 ################################-->
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td height="4" colspan="3">
                        </td>
                    </tr>
                    <tr>
                        <td width="26" height="35">
                            <img src="/COMS/images/basic/icon_02.gif" width="25" height="20">
                        </td>
                        <td class="contents_title">
                            Đăng ký tài sản ra cổng (반출 신청)
                        </td>
                        <td align="right" class="location">
                            HOME &gt;Đăng ký tài sản ra cổng (반출 신청)
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" class="title_line">
                        </td>
                    </tr>
                </table>
                <!--################################ 타이틀, 현재위치 끝 ################################-->
            </td>
        </tr>
        <tr>
            <td valign="top">
                <table width="100%" cellpadding="6" cellspacing="1" style="background-color: #CCCCCC"
                    class="table table-bordered">
                    <tr>
                        <td colspan="6" class="title" style="background-color: #FFFFFF">
                            Thông tin người đăng ký (신청자 정보)
                        </td>
                    </tr>
                    <tr>
                        <td style="background-color: #F5F5F5">
                            Bộ phận(부서명)
                        </td>
                        <td style="background-color: #FFFFFF">
                            <asp:Label ID="lblDepartment" runat="server"></asp:Label>
                        </td>
                        <td style="background-color: #F5F5F5">
                            ID(사 번)
                        </td>
                        <td style="background-color: #FFFFFF">
                            <asp:Label ID="lblUpnid" runat="server"></asp:Label>
                        </td>
                        <td style="background-color: #F5F5F5">
                            Nơi làm việc(사업장)
                        </td>
                        <td style="background-color: #FFFFFF">
                            <asp:Label ID="lblOfficeName" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="background-color: #F5F5F5">
                            Tên(성명)
                        </td>
                        <td style="background-color: #FFFFFF">
                            <asp:Label ID="lblDisplayName" runat="server"></asp:Label>
                        </td>
                        <td style="background-color: #F5F5F5">
                            Chức vụ(직급)
                        </td>
                        <td style="background-color: #FFFFFF">
                            <asp:Label ID="lblTitle" runat="server"></asp:Label>
                        </td>
                        <td style="background-color: #F5F5F5">
                            Liên lạc(연락처)
                        </td>
                        <td style="background-color: #FFFFFF">
                            <asp:Label ID="lblPhone" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
                <%=tableApprove%>
                <%-- chỉnh sửa giao diện cho chữ tiếng hàn xuống dòng
        phạm thị thu hiền 29/01/2021
                --%>
                <table width="100%" cellpadding="6" cellspacing="1" border="0" style="background-color: #CCCCCC"
                    class="table table-bordered">
                    <tr>
                        <td colspan="6" class="title" style="background-color: #FFFFFF">
                            Đăng ký thông tin tài sản ra cổng (반출 정보 등록)
                        </td>
                    </tr>
                    <tr>
                        <td style="background-color: #F5F5F5; height: 20px;">
                            Mã tài sản ra cổng<br />
                            (반출번호)
                        </td>
                        <td style="background-color: #FFFFFF;">
                            <asp:Label ID="lblTakeOutDataCode" runat="server"></asp:Label>
                        </td>
                        <td style="background-color: #F5F5F5">
                            Ngày dự định mang ra cổng<br />
                            (반출 예정일)
                        </td>
                        <td style="background-color: #FFFFFF">
                            <input type="text" name="scheduleOutDate" class="input form-control col-6" readonly
                                value="<%=scheduleDateOut%>" data-datepicker data-format="yyyy-MM-DD" />
                            <%--    <img src="../../images/icon/calendar.gif" alt="날짜선택" style="cursor:hand" align="absmiddle" onclick="popUpCalendar(this, document.forms[0].scheduleOutDate,'yyyy-mm-dd',-1,-1);"/>--%>
                        </td>
                        <td style="background-color: #F5F5F5">
                            <div style="display: none" id="scheduleDateTitle">
                                Ngày dự định mang vào<br />
                                (반입 예정일)
                            </div>
                        </td>
                        <td style="background-color: #FFFFFF">
                            <div id="scheduleDateValue" style="display: none">
                                <input type="text" name="scheduleInDate" class="input form-control col-6" readonly
                                    value="<%=scheduleDateTitle%>" data-datepicker data-format="yyyy-MM-DD" />
                                <%--		<img src="../../images/icon/calendar.gif" alt="lựa chọn ngày (날짜선택)" style="cursor:hand" align="absmiddle"  onclick="popUpCalendar(this, document.forms[0].scheduleInDate,'yyyy-mm-dd',950,330);"/>--%>
                           
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td style="background-color: #F5F5F5">
                            Mục đích mang ra<br />
                            (반출목적)
                        </td>
                        <td style="background-color: #FFFFFF">
                            <asp:DropDownList ID="takeOutObjectCode" runat="server" DataSourceID="ObjectDataSourceVisitObject"
                                DataTextField="CodeName" DataValueField="TakeOutObjectCode" Width="223px" CssClass="form-control">
                            </asp:DropDownList>
                            <asp:ObjectDataSource ID="ObjectDataSourceVisitObject" runat="server" SelectMethod="selectTakeOutObjectList"
                                TypeName="HanaMicron.COMS.BLL.TakeOutObject">
                                <SelectParameters>
                                    <asp:Parameter Name="key" Type="String" DefaultValue="A" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                        </td>
                        <td style="background-color: #F5F5F5">
                            Mục đích chi tiết<br />
                            (세부목적)
                        </td>
                        <td colspan="4" style="background-color: #FFFFFF">
                            <input type="text" name="objectContents" class="input form-control" size="65" value="<%=objectContents%>" />
                        </td>
                    </tr>
                    <tr>
                        <td style="background-color: #F5F5F5">
                            Lộ trình tài sản ra cổng<br />
                            (반출경로)
                        </td>
                        <td style="background-color: #FFFFFF" class="form-inline">
                            <asp:DropDownList ID="takeOutPathStart" runat="server" DataSourceID="ObjectDataSource2"
                                DataTextField="TakeOutPathStartName" DataValueField="TakeOutPathStartCode" CssClass="form-control col-3">
                            </asp:DropDownList>
                            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="selectTakeOutPathStartList"
                                TypeName="HanaMicron.COMS.BLL.TakeOutPathStart">
                                <SelectParameters>
                                    <asp:Parameter Name="key" Type="String" DefaultValue="A" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                            ☞
                            <asp:DropDownList ID="takeOutPathEnd" runat="server" DataSourceID="ObjectDataSource3"
                                DataTextField="TakeOutPathEndName" DataValueField="TakeOutPathEndCode" CssClass="form-control col-4">
                            </asp:DropDownList>
                            <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" SelectMethod="selectTakeOutPathEndList"
                                TypeName="HanaMicron.COMS.BLL.TakeOutPathEnd">
                                <SelectParameters>
                                    <asp:Parameter Name="key" Type="String" DefaultValue="A" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                        </td>
                        <td style="background-color: #F5F5F5">
                            Địa điểm<br />
                            (반출처)
                        </td>
                        <td style="background-color: #FFFFFF">
                            <input type="hidden" name="companyCode" value="<%=companyCode%>" />
                            <input type="text" name="companyName" size="24" class="input" readonly value="<%=companyName%>" />
                            <img src="../../images/icon/searchKor.gif" onclick="newWinByNameByScroll('../company/searchCompany.aspx','car',950,500)"
                                style="cursor: hand; vertical-align: middle" alt="업체 조회" />
                        </td>
                        <td style="background-color: #F5F5F5">
                            Người nhận<br />
                            (수령자)
                        </td>
                        <td style="background-color: #FFFFFF">
                            <input type="text" name="recieveName" class="input form-control" value="<%=recieveName%>" />
                        </td>
                    </tr>
                    <tr>
                        <td style="background-color: #F5F5F5">
                            Có mang vào hay không<br />
                            (반입여부)
                        </td>
                        <td style="background-color: #FFFFFF">
                            <input type="radio" name="requireIN" value="1" onclick="displaySuffle()" <%=ckRequire1%> />
                            Cần mang vào (반입필)
                            <input type="radio" name="requireIN" value="2" onclick="displaySuffle()" <%=ckRequire2%> />
                            Không thể mang vào (반입불가)
                        </td>
                        <td style="background-color: #F5F5F5">
                            <div id="disApproveTitle" style="display: none">
                                Lí do từ chối (불가사유)
                            </div>
                        </td>
                        <td style="background-color: #FFFFFF">
                            <div id="disApproveValue" style="display: none">
                                <asp:DropDownList ID="disApprovalCategoryCode" runat="server" DataSourceID="ObjectDataSource1"
                                    DataTextField="CodeName" DataValueField="DisApprovalCategoryCode">
                                </asp:DropDownList>
                                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="selectDisApprovalCategoryList"
                                    TypeName="HanaMicron.COMS.BLL.DisApprovalCategory">
                                    <SelectParameters>
                                        <asp:Parameter Name="key" Type="String" DefaultValue="A" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                            </div>
                        </td>
                        <td style="background-color: #F5F5F5">
                            <div id="disApproveDetailTitle" style="display: none">
                                Chi tiết lí do từ chối (불가세부사유)
                            </div>
                        </td>
                        <td style="background-color: #FFFFFF">
                            <div id="disApproveDetailValue" style="display: none">
                                <input type="text" name="disApprovalCategoryDetail" class="input" value="<%=disApprovalCategoryDetail%>" />
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td style="background-color: #F5F5F5">
                            Biển số xe<br />
                            (차량번호)
                        </td>
                        <td style="background-color: #FFFFFF">
                            <input type="hidden" name="carCode" value="<%=carCode%>" />
                            <input type="text" name="carNumber" value="<%=carNumber%>" class="input form-control col-3"
                                readonly />
                            <img src="../../images/icon/searchKor.gif" onclick="newWinByNameByScroll('../car/searchCar.aspx','car',1000,500)"
                                style="cursor: hand;" alt="Tra cứu xe (차량 조회)" />
                            <%--<img src="../../images/icon/write.gif" onclick="newWinByNameByScroll('../../admin/car/carDataInput.aspx','car',600,500)" style="cursor:hand;vertical-align:middle" alt="차량 등록" />--%>
                            <img src="../../images/icon/write.gif" onclick="newWinByNameByScroll('../car/carEdit.aspx','car',600,500)"
                                style="cursor: hand;" alt="Đăng ký xe (차량 등록)" />
                            <br />
                            ※ Không bắt buộc nhập biển số xe (차량번호 입력은 필수사항이 아닙니다).
                        </td>
                        <td style="background-color: #F5F5F5">
                            Ghi chú<br />
                            (비고)
                        </td>
                        <td colspan="3" style="background-color: #FFFFFF">
                            <input type="text" name="note" class="input form-control" value="<%=note%>" size="65" />
                        </td>
                    </tr>
                </table>
                <table width="100%" style="background-color: #cccccc" class="">
                    <tr style="background-color: #FFFFFF">
                        <td colspan="5" class="title">
                            Thông tin vật phẩm mang ra cổng (반출 물품 정보)
                        </td>
                        <td colspan="2" align="right">
                            <input id="Button1" type="button" value="Thêm(추가)" onclick="insertRow()" />
                            <input id="Button2" type="button" value="Xóa(삭제)" onclick="deleteRow()" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="8" style="background-color: #FFFFFF">
                            <table id="takeOutItemList" style="width: 100%">
                                <tr align="center">
                                    <td>
                                        STT<br />
                                        (순번)
                                    </td>
                                    <td>
                                        Chọn (선택)
                                    </td>
                                    <td>
                                        Tài sản lớn<br />
                                        (대분류)
                                    </td>
                                    <td>
                                        Tài sản nhỏ<br />
                                        (소분류)
                                    </td>
                                    <td>
                                        Tên vật phẩm<br />
                                        (품명)
                                    </td>
                                    <td>
                                        Quy cách<br />
                                        (규격/Serial No)
                                    </td>
                                    <td>
                                        Số lượng<br />
                                        (수량)
                                    </td>
                                    <td>
                                        Đơn vị<br />
                                        (단위)
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <%--2021-03-26 Nguyen Van An: 반출신정할 때 첨부 파일 추가 가능 _ 박민수 차장 요정--%>
                <table width="100%" cellpadding="6" cellspacing="1" border="0" style="background-color: #CCCCCC"
                    class="">
                    <tr>
                        <td colspan="2" class="title" style="background-color: #FFFFFF">
                            <strong>Đính kèm hình ảnh của sản phẩm (Hãy đăng ký hình ảnh sản phẩm trước khi đóng
                                gói) (반출 제품의 사진 첨부(제품 포장 전의 사진을 등록하세요))</strong>
                        </td>
                    </tr>
                    <tr>
                        <td style="background-color: #F5F5F5; height: 17px;">
                            File đính kèm 1 (첨부파일 1)
                        </td>
                        <td style="background-color: #FFFFFF; height: 17px;">
                            <asp:FileUpload ID="userFile1" runat="server" Width="400px"  />
                            <asp:Label ID="lblUserFile1" runat="server" Text=""></asp:Label>
                            <asp:RegularExpressionValidator ID="rev" runat="server" ForeColor="Red"
        ErrorMessage="File không hợp lệ" ControlToValidate="userFile1"     ValidationExpression="^([0-9a-zA-Z_\-~:\\])+(.jpg|.JPG|.jpeg|.JPEG|.bmp|.BMP|.gif|.GIF|.png|.PNG)$">
 </asp:RegularExpressionValidator>
                            
                        </td>
                    </tr>
                    <tr>
                        <td style="background-color: #F5F5F5">
                            File đính kèm 2 (첨부파일 2)
                        </td>
                        <td style="background-color: #FFFFFF">
                            <asp:FileUpload ID="userFile2" runat="server" Width="400px"   />
                            <asp:Label ID="lblUserFile2" runat="server" Text=""></asp:Label>
                              <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ForeColor="Red"
        ErrorMessage="File không hợp lệ" ControlToValidate="userFile2" ValidationExpression="^([0-9a-zA-Z_\-~:\\])+(.jpg|.JPG|.jpeg|.JPEG|.bmp|.BMP|.gif|.GIF|.png|.PNG)$"> </asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="background-color: #F5F5F5">
                            File đính kèm 3 (첨부파일 3)
                        </td>
                        <td style="background-color: #FFFFFF">
                            <asp:FileUpload ID="userFile3" runat="server" Width="400px"   />
                            <asp:Label ID="lblUserFile3" runat="server" Text=""></asp:Label>
                              <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ForeColor="Red"
        ErrorMessage="File không hợp lệ" ControlToValidate="userFile3"
         ValidationExpression="^([0-9a-zA-Z_\-~:\\])+(.jpg|.JPG|.jpeg|.JPEG|.bmp|.BMP|.gif|.GIF|.png|.PNG)$">
 </asp:RegularExpressionValidator>
                        </td>
                        <asp:Label ID="thongbao" runat="server" ForeColor="Red"></asp:Label>
                    </tr>
                </table>
                <input type="hidden" name="approvalUserCode" />
                <input type="hidden" name="elecApproveCode" value="<%=approveDocCode%>" />
                <input type="hidden" name="parentTakeOutItemCategoryCodes" />
                <input type="hidden" name="subTakeOutItemCategoryCodes" />
                <input type="hidden" name="takeOutItemNames" />
                <input type="hidden" name="takeOutItemNameTypes" />
                <input type="hidden" name="takeOutItemAccounts" />
                <input type="hidden" name="takeOutUnits" />
                <table width="100%">
                    <tr>
                        <td align="center">
                            <img src="../../images/icon/write.gif" style="cursor: hand" onclick="approveChoice()"
                                alt="Đăng ký (등록하기)" />
                            <img src="../../images/icon/cancel.gif" style="cursor: hand" onclick="history.go(-1)"
                                alt="Hủy bỏ (취소하기)" />
                        </td>
                    </tr>
                </table>
            </td>
            <td width="20" valign="top">
                &nbsp;
            </td>
        </tr>
    </table>
    <script language="javascript" type="text/javascript">
var parentCategory=new Array();
var subCategory=new Array();
var itemName=new Array();
var itemType=new Array();
var account=new Array();
var unit=new Array();

<%=arrTakeOutItemList%>

//로딩하면서 초기 화면에 뿌리기
function display(displayCellCount){
	if(!displayCellCount) displayCellCount=defaultCellCount;
	for(var cellCount=0;cellCount<displayCellCount;cellCount++){
		insertRow();
	}
}

// Data 를 보여준다.
function dataBind(){
	var target=document.getElementById("takeOutItemList");
	for(var i=0;i<parentCategory.length+1;i++){
		var rowCount=i+1;
		if(parentCategory[i]){
			target.rows[rowCount].cells[2].children[0].value=parentCategory[i];
			
			getSubCategory(target.rows[rowCount].cells[2].children[0]);
			
			target.rows[rowCount].cells[3].children[0].value=subCategory[i];
			target.rows[rowCount].cells[4].children[0].value=itemName[i];
			target.rows[rowCount].cells[5].children[0].value=itemType[i];
			target.rows[rowCount].cells[6].children[0].value=account[i];
			target.rows[rowCount].cells[7].children[0].value=unit[i];
		}
	}
}

// 반입필 여부 체크 Có/ không check khi vào
function displaySuffle(){
	if(document.forms[0].requireIN[0].checked==true){
		document.getElementById('scheduleDateTitle').style.display="block";
		document.getElementById('scheduleDateValue').style.display="block";
		 
		document.getElementById('disApproveTitle').style.display="none";
		document.getElementById('disApproveValue').style.display="none";
		document.getElementById('disApproveDetailTitle').style.display="none";
		document.getElementById('disApproveDetailValue').style.display="none";
		
	}else if(document.forms[0].requireIN[1].checked==true){
		document.getElementById('scheduleDateTitle').style.display="none";
		document.getElementById('scheduleDateValue').style.display="none";
		
		document.getElementById('disApproveTitle').style.display="block";
		document.getElementById('disApproveValue').style.display="block";
		document.getElementById('disApproveDetailTitle').style.display="block";
		document.getElementById('disApproveDetailValue').style.display="block";
	}else{
		document.forms[0].requireIN[0].checked=true;
		
		document.getElementById('scheduleDateTitle').style.display="block";
		document.getElementById('scheduleDateValue').style.display="block";
		
		document.getElementById('disApproveTitle').style.display="none";
		document.getElementById('disApproveValue').style.display="none";
		document.getElementById('disApproveDetailTitle').style.display="none";
		document.getElementById('disApproveDetailValue').style.display="none";
	}
}
display(displayCellCount);
dataBind();
displaySuffle();
</script>
</asp:Content>
