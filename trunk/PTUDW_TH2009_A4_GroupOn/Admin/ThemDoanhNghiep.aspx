<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ThemDoanhNghiep.aspx.cs" Inherits="PTUDW_TH2009_A4_GroupOn.Admin.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 140px;
        }
        .style2
        {
            width: 143px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server">
    <asp:Label ID="Label1" runat="server" Text="Thêm địa chỉ doanh nghiệp"></asp:Label>
    <br />
    <table class="ui-accordion">
        <tr>
            <td class="style1">
                <asp:Label ID="Label2" runat="server" Text="Mã địa chỉ"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtMadc" runat="server"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToValidate="txtMadc" ErrorMessage="Vui lòng nhập số" 
                    Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtMadc" ErrorMessage="Ô này bị bỏ trống"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="Label3" runat="server" Text="Địa chỉ 1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtDC1" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtDC1" ErrorMessage="Ô này bị bỏ trống"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="Label4" runat="server" Text="Địa chỉ 2"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtDC2" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txtDC2" ErrorMessage="Ô này bị bỏ trống"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="Label5" runat="server" Text="Địa chỉ 3"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtDC3" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="txtDC3" ErrorMessage="Ô này bị bỏ trống"></asp:RequiredFieldValidator>
            </td>
        </tr>
    </table>
    <br />
    <asp:Button ID="ButtonThemDC" runat="server" onclick="ButtonThemDC_Click" 
        Text="Thêm địa chỉ" />
    <br />
    <br />
    <table class="ui-accordion">
        <tr>
            <td class="style2">
                <asp:Label ID="Label6" runat="server" Text="Mã doanh nghiệp"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtMadn" runat="server"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator2" runat="server" 
                    ControlToValidate="txtMadn" ErrorMessage="Vui lòng nhập số" 
                    Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="txtMadn" ErrorMessage="Ô này bị bỏ trống"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label7" runat="server" Text="Tên doanh nghiệp"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtTenDN" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="txtTenDN" ErrorMessage="Ô này bị bỏ trống"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label8" runat="server" Text="Số điện thoại"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtSDT" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ControlToValidate="txtSDT" ErrorMessage="Ô này bị bỏ trống"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label9" runat="server" Text="Giới thiệu"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtIntro" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                    ControlToValidate="txtIntro" ErrorMessage="Ô này bị bỏ trống"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label10" runat="server" Text="Website"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtWeb" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                    ControlToValidate="txtWeb" ErrorMessage="Ô này bị bỏ trống"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label11" runat="server" Text="Email"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="txtEmail" ErrorMessage="Vui lòng nhập đúng kiểu email" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                    ControlToValidate="txtEmail" ErrorMessage="Ô này bị bỏ trống"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label12" runat="server" Text="Kinh độ"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtKinhdo" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                    ControlToValidate="txtKinhdo" ErrorMessage="Ô này bị bỏ trống"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label13" runat="server" Text="Vĩ độ"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtViDo" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                    ControlToValidate="txtViDo" ErrorMessage="Ô này bị bỏ trống"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label14" runat="server" Text="Mã địa chỉ"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtMadc2" runat="server"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator3" runat="server" 
                    ControlToValidate="txtMadc2" ErrorMessage="Vui lòng nhập số" 
                    Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                    ControlToValidate="txtMadc2" ErrorMessage="Ô này bị bỏ trống"></asp:RequiredFieldValidator>
            </td>
        </tr>
    </table>
    <br />
    <asp:Button ID="ButtonThemDN" runat="server" onclick="Button1_Click" 
        Text="Thêm doanh nghiệp" />
    </form>
</asp:Content>
