<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="TrangChuAdmin.aspx.cs" Inherits="PTUDW_TH2009_A4_GroupOn.Admin.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server">
    <asp:HyperLink ID="HyperLink1" runat="server" 
        NavigateUrl="~/Admin/QuanLyDonHang.aspx">Quản lý đơn hàng và chi tiết đơn hàng</asp:HyperLink>
    <br />
    <br />
    <asp:HyperLink ID="HyperLink2" runat="server" 
        NavigateUrl="~/Admin/QuanLyDoanhNghiep.aspx">Quản lý doanh nghiệp</asp:HyperLink>
    <br />
    <br />
    <asp:HyperLink ID="HyperLink3" runat="server" 
        NavigateUrl="~/Admin/QuanLyTaiKhoanDN.aspx">Quản lý tài khoản doanh nghiệp</asp:HyperLink>
    <br />
    <br />
    <asp:HyperLink ID="HyperLink4" runat="server" 
        NavigateUrl="~/Admin/QuanLyTaiKhoanMember.aspx">Quản lý tài khoản thành viên</asp:HyperLink>
    <br />
    <br />
    <asp:HyperLink ID="HyperLink5" runat="server" 
        NavigateUrl="~/Admin/QuanLyComment.aspx">Quản lý comment</asp:HyperLink>
    </form>
</asp:Content>
