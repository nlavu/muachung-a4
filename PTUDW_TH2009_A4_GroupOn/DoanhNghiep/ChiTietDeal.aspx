<%@ Page Title="" Language="C#" MasterPageFile="~/DoanhNghiep/DoanhNghiepSite.Master" AutoEventWireup="true" CodeBehind="ChiTietDeal.aspx.cs" Inherits="PTUDW_TH2009_A4_GroupOn.DoanhNghiep.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 246px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style1">
        <tr>
            <td class="style2">
    <asp:Label ID="LabelMaVoucher" runat="server" Text="Ma Voucher"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtMaVoucher" runat="server" Width="215px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="LabelTenVoucher" runat="server" Text="Ten Voucher"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtTenVoucher" runat="server" Width="215px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="LabelTGBD" runat="server" Text="Thời gian bắt đầu khuyến mãi"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtTGBD" runat="server" Width="215px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="LabelTGKT" runat="server" Text="Thời gian kết thúc khuyến mãi"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtTGKT" runat="server" Width="215px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="LabelNoiDung" runat="server" Text="Nội Dung"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtNoiDung" runat="server" Width="215px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="LabelGiaGoc" runat="server" Text="Giá gốc"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtGiaGoc" runat="server" Width="215px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="LabelGiaKM" runat="server" Text="Giá khuyến mãi"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtGiaKhuyenMai" runat="server" Width="215px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="LabelSLKho" runat="server" Text="Số lượng trong kho"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtSLKho" runat="server" Width="215px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="LabelSLDaMua" runat="server" Text="Số lượng đã mua"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtSLDaMua" runat="server" Width="215px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
    <asp:Label ID="LabelVip" runat="server" Text="VIP"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtVip" runat="server" Width="215px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
    <asp:Label ID="LabelThoiGianBan" runat="server" Text="Tổng thời gian bán"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtThoiGianBan" runat="server" Width="215px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
    <asp:Label ID="LabelTrangThaiDuyet" runat="server" Text="Trạng thái duyệt"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtTrangThaiDuyet" runat="server" Width="215px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
    <asp:Label ID="LabelMaHinh" runat="server" Text="Mã hình"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlHinh" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style2">
    <asp:Label ID="LabelMaLoaiVoucher" runat="server" Text="Mã loại voucher"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlVoucher" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style2">
    <asp:Label ID="LabelKV" runat="server" Text="Mã khu vực"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlKV" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style2">
    <asp:Label ID="LabelDN" runat="server" Text="Mã doanh nghiệp"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlDN" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style2">
    <asp:Label ID="LabelAvai" runat="server" Text="Available"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlAvai" runat="server">
                    <asp:ListItem Value="1">Có</asp:ListItem>
                    <asp:ListItem Value="0">Không</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        </table>
    <asp:Button ID="ButtonUpdate" runat="server" onclick="ButtonUpdate_Click" 
        Text="Cập nhật" />
    <br />
</asp:Content>
