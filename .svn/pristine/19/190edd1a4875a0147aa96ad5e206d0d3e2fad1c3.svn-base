<%@ Page Language="C#" AutoEventWireup="true" CodeFile="esd.aspx.cs" Inherits="esd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
    integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
    crossorigin="anonymous">
<script src="../../include/Calender/js/jsCalendar.js"></script>
<script src="../../include/Calender/js/jsCalendar.datepicker.js"></script>
<script type="text/javascript">
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


</script>
<body>
    <table>
<tr>
<td style="width:5% ; text-align:center ;  font-weight: bold;    float: right; margin-top: 15px;">
                                                <a href="/COMS/Default.aspx"><img src="/COMS/images/logo22.png" border="0"></a>
                                                 </td>
                        </tr>
                        <tr>

                                                <a href="/COMS/logout.aspx" class="btn_logout" onclick="goLogout();return false;">                            
                                                <img src="/COMS/images/logout.gif" style=" width:50px;height:40px ; float: right; "border="0"alt="LogOut""/> </a>
                                                 <a href="/COMS/logout.aspx" style="float: right; ">Logout</a>

</tr>

                                           

</table>
    <form id="form1" runat="server" class="container">
    <table width="100%">
        <tr>
            <td align="right" style="height: 27px">
                <asp:DropDownList ID="ddlKeyWord1" runat="server">
                    <asp:ListItem Value="companyName">Tên công ty (업체명)</asp:ListItem>
                    <asp:ListItem Value="visitorName">Tên (Khách thăm) (성명(내방객))</asp:ListItem>
                  <%--  <asp:ListItem Value="visitorName">Số Điện Thoại</asp:ListItem>
                --%></asp:DropDownList>
                <asp:TextBox ID="txtKey1" runat="server" Width="80px" CssClass="input1" Style="ime-mode: active"></asp:TextBox>
                <asp:Button ID="Button2" runat="server" Text="Tìm kiếm (검색)" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtKey1" ErrorMessage="Nhập từ khóa tìm kiếm (검색어를 입력하세요)" ForeColor="#FF3300"></asp:RequiredFieldValidator>

            </td>
        </tr>
    </table>
    <table width="100%">
        <tr>
            <td style="text-align: center">
                <asp:GridView ID="GridView1" runat="server" DataSourceID="ObjectDataSource1" AutoGenerateColumns="False"
                    OnRowDataBound="GridView1_RowDataBound1" CssClass="table table-hover">
                    <Columns>
                        <asp:BoundField DataField="VisitDataCode" HeaderText="Ngày hẹn (예약일)" SortExpression="VisitDataCode">
                            <HeaderStyle HorizontalAlign="Center" BackColor="#003399" ForeColor="White" />
                        </asp:BoundField>
                        <asp:BoundField DataField="RegDate" HeaderText="Tên (성명)" SortExpression="RegDate">
                            <HeaderStyle HorizontalAlign="Center" BackColor="#003399" ForeColor="White" />
                        </asp:BoundField>
                        <asp:BoundField DataField="VisitObjectContents" HeaderText="Ngày, tháng, năm sinh (생년월일)"
                            SortExpression="VisitObjectContents">
                            <HeaderStyle HorizontalAlign="Center" BackColor="#003399" ForeColor="White" />
                        </asp:BoundField>
                        <asp:BoundField DataField="OfficeContents" HeaderText="Tên công ty (회사명)" SortExpression="OfficeContents">
                            <HeaderStyle HorizontalAlign="Center" BackColor="#003399" ForeColor="White" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ApprovalState" HeaderText="Số xe (차량번호)" SortExpression="ApprovalState">
                            <HeaderStyle HorizontalAlign="Center" BackColor="#003399" ForeColor="White" />
                        </asp:BoundField>
                        <asp:BoundField  DataField="ApproveContents" HeaderText="Mục đích đến (방문목적)" SortExpression="ApproveContents">
                            <HeaderStyle HorizontalAlign="Center" BackColor="#003399" ForeColor="White" />
                        </asp:BoundField>
                        <asp:BoundField  DataField="ApproveContents" HeaderText="Số Điện Thoại ()" SortExpression="ApproveContents" Visible=false>
                            <HeaderStyle HorizontalAlign="Center" BackColor="#003399" ForeColor="White" />
                        </asp:BoundField>
                        <asp:HyperLinkField HeaderText="Hoàn thành đào tạo an toàn (안전 교육이수)">
                            <HeaderStyle BackColor="#003399" ForeColor="White" />
                        </asp:HyperLinkField>
                    </Columns>
                </asp:GridView>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="selectVisitDataList"
                    TypeName="HanaMicron.COMS.BLL.VisitData">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlKeyWord1" Name="keyWord" PropertyName="SelectedValue"
                            Type="String" />
                        <asp:ControlParameter ControlID="txtKey1" Name="key" PropertyName="Text" Type="String" />
                        <asp:Parameter Name="searchStartDate" Type="String" />
                        <asp:Parameter Name="searchEndDate" Type="String" />
                        <asp:Parameter Name="upnid" Type="String" />
                        <asp:Parameter Name="approveUserCode" Type="String" />
                        <asp:Parameter Name="type" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
    
    </table>
    <asp:Panel ID="pnNotice" runat="server" Height="50px" HorizontalAlign="Center" Width="100%">
        Hãy tìm kiếm bằng tên chính xác vì vấn đề rò rỉ thông tin cá nhân (개인정보 누출로 인한 문제로
        정확한 이름으로 검색하셔야 합니다).</asp:Panel>
    <asp:HiddenField ID="index" runat="server" />
    </td> </tr> </table>
    </form>
     <asp:Label  runat="server" ID="tex1"></asp:Label>
</body>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</html>