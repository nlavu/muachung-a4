<%@ Page Title="" Language="C#" MasterPageFile="~/DoanhNghiep/DoanhNghiepSite.Master" AutoEventWireup="true" CodeBehind="SuaThongTinDN.aspx.cs" Inherits="PTUDW_TH2009_A4_GroupOn.DoanhNghiep.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 202px;
        }
        .style3
        {
            width: 199px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <asp:Label ID="Label1" runat="server" Text="Sửa mật khẩu:"></asp:Label>
        <table class="style1">
            <tr>
                <td class="style2">
                    <asp:Label ID="Label2" runat="server" Text="Mật khẩu mới"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPass" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtPass" ErrorMessage="Vui lòng nhập mật khẩu"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="Label3" runat="server" Text="Xác nhận mật khẩu mới"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPassComfirm" TextMode="password" runat="server"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" 
                        ControlToCompare="txtPass" ControlToValidate="txtPassComfirm" 
                        ErrorMessage="Vui lòng nhập đúng mật khẩu đã nhập"></asp:CompareValidator>
                </td>
            </tr>
        </table>
    </p>
    <p>
        <asp:Button ID="ButtonPassUpdate" runat="server" 
            onclick="ButtonPassUpdate_Click" Text="Cập nhật" />
    </p>
    <p>
        &nbsp;</p>
    <asp:Label ID="Label4" runat="server" Text="Sửa thông tin cá nhân"></asp:Label>
    <br />
    <table class="style1">
        <tr>
            <td class="style3">
                <asp:Label ID="Label5" runat="server" Text="Tên doanh nghiệp"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtTenDN" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtTenDN" ErrorMessage="Vui lòng nhập thông tin"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:Label ID="Label6" runat="server" Text="Số điện thoại"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtSDT" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txtSDT" ErrorMessage="Vui lòng nhập thông tin"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:Label ID="Label7" runat="server" Text="Giới thiệu"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtIntro" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="txtIntro" ErrorMessage="Vui lòng nhập thông tin"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:Label ID="Label8" runat="server" Text="Website"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtWeb" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="txtWeb" ErrorMessage="Vui lòng nhập thông tin"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:Label ID="Label9" runat="server" Text="Email"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="txtEmail" ErrorMessage="Vui lòng nhập thông tin"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:Label ID="Label10" runat="server" Text="Mã địa chỉ"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlDN" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
    </table>
    <p>
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
            Text="Cập nhật" />
    </p>
</asp:Content>
