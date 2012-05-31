﻿<%@ Page Title="" Language="C#" MasterPageFile="~/DoanhNghiep/DoanhNghiepSite.Master" AutoEventWireup="true" CodeBehind="UpdateDeal.aspx.cs" Inherits="PTUDW_TH2009_A4_GroupOn.DoanhNghiep.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="LabelMaVoucher" runat="server" Text="Mã voucher cần cập nhật"></asp:Label>
&nbsp;<asp:TextBox ID="TextBoxMaVoucher" runat="server"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="LabelTenVoucher" runat="server" Text="Tên voucher"></asp:Label>
    <asp:TextBox ID="TextBoxTenVoucher" runat="server"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="LabelThoiGianBatDau" runat="server" 
        Text="Thời gian bắt đầu khuyến mãi"></asp:Label>
    <asp:TextBox ID="TextBoxThoiGianBatDau" runat="server"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="LabelThoiGianKetThuc" runat="server" 
        Text="Thời gian kết thúc khuyến mãi"></asp:Label>
    <asp:TextBox ID="TextBoxThoiGianKetThuc" runat="server"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="LabelNoiDung" runat="server" Text="Nội dung"></asp:Label>
    <asp:TextBox ID="TextBoxNoiDung" runat="server"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="LabelGiaGoc" runat="server" Text="Giá gốc"></asp:Label>
    <asp:TextBox ID="TextBoxGiaGoc" runat="server"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="LabelGiaKhuyenMai" runat="server" Text="Giá khuyến mãi"></asp:Label>
    <asp:TextBox ID="TextBoxGiaKhuyenMai" runat="server"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="LabelSoLuongNhapKho" runat="server" Text="Số lượng nhập kho"></asp:Label>
    <asp:TextBox ID="TextBoxSoLuongNhapKho" runat="server"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="LabelVIP" runat="server" Text="Thuộc tính VIP"></asp:Label>
    <asp:DropDownList ID="DropDownListVIP" runat="server">
        <asp:ListItem Value="1">Có</asp:ListItem>
        <asp:ListItem Value="0">Không</asp:ListItem>
    </asp:DropDownList>
    <br />
    <br />
    <asp:Label ID="LabelThoiGianBan" runat="server" Text="Thời gian bán"></asp:Label>
    <asp:TextBox ID="TextBoxThoiGianBan" runat="server"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="LabelMaHinhAnh" runat="server" Text="Mã hình ảnh"></asp:Label>
    <asp:DropDownList ID="DropDownListHinhAnh" runat="server" 
        DataSourceID="SqlDataSource1" DataTextField="MAHINHANH" 
        DataValueField="MAHINHANH">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:MuaChungConnectionString %>" 
        SelectCommand="SELECT [MAHINHANH] FROM [HinhAnh]"></asp:SqlDataSource>
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <br />
    <asp:Label ID="LabelMaLoaiVoucher" runat="server" Text="Mã loại voucher"></asp:Label>
    <asp:DropDownList ID="DropDownListLoaiVoucher" runat="server" 
        DataSourceID="SqlDataSource2" DataTextField="TENLOAIVOUCHER" 
        DataValueField="MALOAIVOUCHER">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:MuaChungConnectionString %>" 
        SelectCommand="sp_LoaiVoucherXem" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>
    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
    <br />
    <asp:Label ID="LabelKhuVuc" runat="server" Text="Mã khu vực"></asp:Label>
    <asp:DropDownList ID="DropDownListKhuVuc" runat="server" 
        DataSourceID="SqlDataSource3" DataTextField="TENKHUVUC" 
        DataValueField="MAKHUVUC">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:MuaChungConnectionString %>" 
        SelectCommand="sp_KhuVucXem" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>
    <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
    <br />
    <br />
    <asp:Label ID="LabelDoanhNghiep" runat="server" Text="Mã doanh nghiệp"></asp:Label>
    <asp:TextBox ID="TextBoxDN" runat="server"></asp:TextBox>
    <br />
    <br />
    <asp:Button ID="ButtonCapNhat" runat="server" onclick="ButtonCapNhat_Click" 
        Text="Cập nhật!" />
</asp:Content>
