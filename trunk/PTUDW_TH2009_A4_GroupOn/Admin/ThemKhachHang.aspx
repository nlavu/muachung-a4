<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ThemKhachHang.aspx.cs" Inherits="PTUDW_TH2009_A4_GroupOn.Admin.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 144px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server">
    <table class="ui-accordion">
        <tr>
            <td class="style1">
                <asp:Label ID="Label1" runat="server" Text="Mã khách hàng"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtMaKH" runat="server"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToValidate="txtMaKH" ErrorMessage="Mã khách hàng phải là số" 
                    Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtMaKH" ErrorMessage="Ô này bị bỏ trống"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="Label2" runat="server" Text="Địa chỉ"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtDC" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtDC" ErrorMessage="Ô này bị bỏ trống"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="Label3" runat="server" Text="Email"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="txtEmail" ErrorMessage="Vui lòng nhập đúng kiểu email" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txtEmail" ErrorMessage="Ô này bị bỏ trống"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="Label4" runat="server" Text="Số điện thoại"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtSDT" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="txtSDT" ErrorMessage="Ô này bị bỏ trống"></asp:RequiredFieldValidator>
            </td>
        </tr>
    </table>
    <br />
    <asp:Button ID="ButtonThemKH" runat="server" onclick="ButtonThemKH_Click" 
        Text="Thêm khách hàng" />
    </form>
</asp:Content>
