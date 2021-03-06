<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="longVisitDataList.aspx.cs" Inherits="main_security_longVisitDataList" Title="Chi tiết đăng ký thăm dài hạn (장기내방 신청 내역)" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script language="javascript" type="text/javascript">
function confirmDelete(url){
    if(confirm('Không thể khôi phục dữ liệu đã bị xóa. \n\nCó chắc chắn xóa không? (한번 삭제된 데이터는 복구가 불가능합니다.\n\n정말로 삭제하시겠습니까?)')){
        window.location=url;
    }else{
        return false;
    }
}

function isNumberKey(evt) {  //  chỉ nhập số trong Card No
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;
    return true;
}

function input(){
    var f=document.forms[0];
    var i;
    var ck_count=0;
    
    // Data가 1줄이면 배열이 생성 안됨. 그래서 1줄이면 checked 속성으로 값을 체크.  // Nếu dữ liệu là 1 dòng thì không được hình thành array. vì vậy, nếu là 1 dòng thì check giá trị thuộc tính checked 
    if (f.selectCheck.length > 0)
    {
        // 체크항목 있는지 확인   xác nhận xem hạng mục kiểm tra có hay không
        for (i=0 ; i<f.selectCheck.length ; i++){
            if(f.selectCheck[i].checked == true){
                if(f.cardNo[i].value.length < 1 )
                {
                  alert("Hãy nhập Card No (Card No를 입력하세요)");
                  return false;
                }
                ck_count++;
            }
            else
            {
                if(f.cardNo[i].value.length >= 1 )
                {
                  alert("Card No của khách đã được đăng ký (선택되지 않은 내방객의 Card No가 등록 되어 있습니다).");
                  return false;
                }
            }
        }        
        checkSelectBox(f,ck_count);
        
    }else{ 
        if(f.selectCheck.checked == true){
            checkSelectBox(f,1);
        }else{
            checkSelectBox(f,0);
        }
    }    
}

// checkBox 선택 여부 확인.
function checkSelectBox(f,ck_count){

    if(ck_count == 0){
        alert('Không có hạng mục lựa chọn. Hãy kiểm tra lại (선택된 항목이 없습니다. 다시 확인 하여 주세요).');
        return false;
    }else{
        if(confirm('Bạn có muốn xử lý vào cổng không? (입문 처리 하시겠습니까?)')){
            f.action='longVisitProcess.aspx';
            f.submit();
        }else{
            return false;
        }
    }
}
</script>
<script language="javascript" type="text/javascript" src="../../include/js/calendar.js"></script>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
	<td><!--################################ 타이틀, 현재위치 시작 ################################-->
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td colspan="3" style="height: 4px"></td>
		</tr>
		<tr>
			<td width="26" height="35"><img src="/COMS/images/basic/icon_02.gif" width="25" height="20"></td>
			<td class="contents_title">Phòng bảo an (보안실) > Khách thăm dài hạn (장기 내방객)</td>
			<td align="right" class="location">HOME &gt; Phòng bảo an (보안실) > Khách thăm dài hạn (장기 내방객)</td>
		</tr>
		<tr>
			<td colspan="3" class="title_line" style="height: 2px"></td>
		</tr>
	</table>
	<!--################################ 타이틀, 현재위치 끝 ################################--></td>
</tr>
<tr>
	<td height="10"></td>
</tr>
<tr>
	<td valign="top">
		<table width="100%">
			<tr>
				<td align="left" style="height: 27px">
                    &nbsp; &nbsp;&nbsp;
						<asp:DropDownList id="ddlKeyWord" runat="server">
                            <asp:ListItem Value="visitorName">Tên (Khách thăm) (성명(내방객))</asp:ListItem>
                            <asp:ListItem Value="companyName">Tên công ty (업체명)</asp:ListItem>
						    <asp:ListItem Value="DEPART_MTB.dep_name">Bộ phận đăng ký (신청부서)</asp:ListItem>
						    <asp:ListItem Value="reqUser.displayName">Người đăng ký (신청자)</asp:ListItem>
						</asp:DropDownList>
						<asp:TextBox id="txtKey" runat="server" Width="80px" CssClass="input1" style="ime-mode:active"></asp:TextBox>
						<asp:Button ID="Button2" runat="server" Text="Tìm kiếm (검색)" ValidationGroup="AllValidators"/>
				<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                        ErrorMessage="RequiredFieldValidator" ValidationGroup="AllValidators" ControlToValidate="txtKey">Nhập từ khóa tìm kiếm (검색어를 입력하세요)</asp:RequiredFieldValidator></td>
				<td align="right">
				    <input type="button" value="Xử lý vào cổng (입문처리)" onclick="input()" id="Button1" />
						<%--<asp:Button ID="Button1" runat="server" Text="입문처리" OnClick="Button1_Click" />--%>&nbsp;
				</td>
			</tr>
		</table>
		<table width="100%">
			<tr style = " text-align:center">
				<td>
				<asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
		CellPadding="3"
		PageSize="50" OnRowDataBound="GridView1_RowDataBound1" Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" OnPageIndexChanged="GridView1_PageIndexChanged" DataSourceID="ObjectDataSource1" EmptyDataText="Không có nội dung đăng ký (등록 된 내용이 없습니다)." CssClass="table table-bordered">
		<FooterStyle BackColor="White" ForeColor="#000066" />
		<Columns>
			<asp:BoundField DataField="VisitDataCode" HeaderText="Chọn (선택)" >
				<ItemStyle HorizontalAlign="Center" Width="70px" />
			</asp:BoundField>
			<asp:BoundField DataField="VisitDataCode" HeaderText="Thời hạn (기간)" >
				<ItemStyle HorizontalAlign="Center" Width="170px"/>
			</asp:BoundField>
			<asp:BoundField DataField="VisitDataCode" HeaderText="Tên (성명)" >
				<ItemStyle HorizontalAlign="Center"  Width="150px"/>
			</asp:BoundField>
			<asp:BoundField DataField="VisitDataCode" HeaderText="Ngày, tháng, năm sinh (생년월일)" >
				<ItemStyle HorizontalAlign="Center" Width="150px" />
			</asp:BoundField>
			<asp:BoundField DataField="VisitDataCode" HeaderText="Tên công ty (회사명)" >
				<ItemStyle HorizontalAlign="Center" />
			</asp:BoundField>
			<asp:BoundField DataField="VisitDataCode" HeaderText="Bộ phận đăng ký (신청부서)" >
				<ItemStyle HorizontalAlign="Center" Width="120px"/>
			</asp:BoundField>
			<asp:BoundField DataField="VisitDataCode" HeaderText="Người đón tiếp (접견자)" >
				<ItemStyle HorizontalAlign="Center" />
			</asp:BoundField>
			<asp:BoundField DataField="VisitDataCode" HeaderText="Số xe (차량번호)" >
				<ItemStyle HorizontalAlign="Center" />
			</asp:BoundField>
			<asp:BoundField DataField="VisitDataCode" HeaderText="Mục đích thăm (방문목적)" >
				<ItemStyle HorizontalAlign="Center" />
			</asp:BoundField>
			<asp:BoundField DataField="VisitDataCode" HeaderText="Liên lạc (연락처)" >
				<ItemStyle HorizontalAlign="Center" />
			</asp:BoundField>
			<asp:HyperLinkField HeaderText="Trạng thái hiện tại (현재상태)" >  
				<ItemStyle HorizontalAlign="Center" />
			</asp:HyperLinkField>
            <asp:TemplateField HeaderText="Card No.">
            <ItemTemplate>
            <input type="text" name='cardNo' style="width:50px; padding-top:5px;"MaxLength="5" onKeyPress="return isNumberKey(event)" />
            </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
		</Columns>
		<SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
		<PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
		<HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
					<RowStyle ForeColor="#000066" />
	</asp:GridView>
					<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="selectLongVisitDataList" TypeName="HanaMicron.COMS.BLL.VisitData">
						<SelectParameters>
                            <asp:Parameter Name="date" Type="String" />
							<asp:ControlParameter ControlID="txtKey" Name="key" PropertyName="Text" Type="String" />
							<asp:ControlParameter ControlID="ddlKeyWord" Name="keyWord" PropertyName="SelectedValue" Type="String" />
						</SelectParameters>
					</asp:ObjectDataSource>
					&nbsp;
				</td>
			</tr>
		</table>
	</td>
	<td width="20" valign="top">&nbsp;</td>
</tr>
</table>
	
</asp:Content>

