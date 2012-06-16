﻿<%@ Page Title="" Language="C#" MasterPageFile="~/DoanhNghiep/DoanhNghiepSite.Master" AutoEventWireup="true" CodeBehind="ThemDeal.aspx.cs" Inherits="PTUDW_TH2009_A4_GroupOn.DoanhNghiep.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 286px;
        }
        .style3
        {
            width: 180px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="Label2" runat="server" Text="Thêm hình ảnh của deal"></asp:Label>
    <br />
    <table class="style1">
        <tr>
            <td class="style3">
                <asp:Label ID="Label3" runat="server" Text="Hình đại diện"></asp:Label>
            </td>
            <td>
                <asp:FileUpload ID="FileUploadDaiDien" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:Label ID="Label4" runat="server" Text="Hình thumbnail"></asp:Label>
            </td>
            <td>
                <asp:FileUpload ID="FileUploadThumb" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:Label ID="Label5" runat="server" Text="Hình 1"></asp:Label>
            </td>
            <td>
                <asp:FileUpload ID="FileUploadHinh1" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:Label ID="Label6" runat="server" Text="Hình 2"></asp:Label>
            </td>
            <td>
                <asp:FileUpload ID="FileUploadHinh2" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:Label ID="Label7" runat="server" Text="Hình 3"></asp:Label>
            </td>
            <td>
                <asp:FileUpload ID="FileUploadHinh3" runat="server" />
            </td>
        </tr>
    </table>
    <br />
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Upload" />
    <br />
    <br />
    <asp:Label ID="Label1" runat="server" Text="Thêm Deal"></asp:Label>
    <br />
    <table class="style1">
        <tr>
            <td class="style2">
    <asp:Label ID="LabelMaVoucher" runat="server" Text="Mã voucher"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBoxMaVoucher" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
    <asp:Label ID="LabelTenVoucher" runat="server" Text="Tên voucher"></asp:Label>
            </td>
            <td>
    <asp:TextBox ID="TextBoxTenVoucher" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
    <asp:Label ID="LabelThoiGianBatDau" runat="server" 
        Text="Thời gian bắt đầu khuyến mãi"></asp:Label>
            </td>
            <td>
    <asp:TextBox ID="TextBoxThoiGianBatDau" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
    <asp:Label ID="LabelThoiGianKetThuc" runat="server" 
        Text="Thời gian kết thúc khuyến mãi"></asp:Label>
            </td>
            <td>
    <asp:TextBox ID="TextBoxThoiGianKetThuc" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
    <asp:Label ID="LabelNoiDung" runat="server" Text="Nội dung"></asp:Label>
            </td>
            <td>
    <asp:TextBox ID="TextBoxNoiDung" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
    <asp:Label ID="LabelGiaGoc" runat="server" Text="Giá gốc"></asp:Label>
            </td>
            <td>
    <asp:TextBox ID="TextBoxGiaGoc" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
    <asp:Label ID="LabelGiaKhuyenMai" runat="server" Text="Giá khuyến mãi"></asp:Label>
            </td>
            <td>
    <asp:TextBox ID="TextBoxGiaKhuyenMai" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
    <asp:Label ID="LabelSoLuongNhapKho" runat="server" Text="Số lượng nhập kho"></asp:Label>
            </td>
            <td>
    <asp:TextBox ID="TextBoxSoLuongNhapKho" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
    <asp:Label ID="LabelVIP" runat="server" Text="Thuộc tính VIP"></asp:Label>
            </td>
            <td>
    <asp:DropDownList ID="DropDownListVIP" runat="server">
        <asp:ListItem Value="1">Có</asp:ListItem>
        <asp:ListItem Value="0">Không</asp:ListItem>
    </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style2">
    <asp:Label ID="LabelThoiGianBan" runat="server" Text="Thời gian bán"></asp:Label>
            </td>
            <td>
    <asp:TextBox ID="TextBoxThoiGianBan" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
    <asp:Label ID="LabelMaHinhAnh" runat="server" Text="Mã hình ảnh"></asp:Label>
            </td>
            <td>
    <asp:DropDownList ID="DropDownListHinhAnh" runat="server" 
        DataSourceID="SqlDataSource1" DataTextField="MAHINHANH" 
        DataValueField="MAHINHANH">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:MuaChungConnectionString %>" 
        SelectCommand="SELECT [MAHINHANH] FROM [HinhAnh]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="style2">
    <asp:Label ID="LabelMaLoaiVoucher" runat="server" Text="Mã loại voucher"></asp:Label>
            </td>
            <td>
    <asp:DropDownList ID="DropDownListLoaiVoucher" runat="server" 
        DataSourceID="SqlDataSource2" DataTextField="TENLOAIVOUCHER" 
        DataValueField="MALOAIVOUCHER">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:MuaChungConnectionString %>" 
        SelectCommand="sp_LoaiVoucherXem" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="style2">
    <asp:Label ID="LabelKhuVuc" runat="server" Text="Mã khu vực"></asp:Label>
            </td>
            <td>
    <asp:DropDownList ID="DropDownListKhuVuc" runat="server" 
        DataSourceID="SqlDataSource3" DataTextField="TENKHUVUC" 
        DataValueField="MAKHUVUC">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:MuaChungConnectionString %>" 
        SelectCommand="sp_KhuVucXem" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>
            </td>
        </tr>
    </table>
    <br />
&nbsp;<asp:Button ID="ButtonNhap" runat="server" onclick="ButtonNhap_Click" 
        Text="Nhập!" />
</asp:Content>
