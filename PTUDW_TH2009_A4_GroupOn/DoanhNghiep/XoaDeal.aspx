<%@ Page Title="" Language="C#" MasterPageFile="~/DoanhNghiep/DoanhNghiepSite.Master" AutoEventWireup="true" CodeBehind="XoaDeal.aspx.cs" Inherits="PTUDW_TH2009_A4_GroupOn.DoanhNghiep.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="LabelMaVoucher" runat="server" Text="Nhập mã voucher cần xóa"></asp:Label>
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <asp:Button ID="ButtonXem" runat="server" onclick="ButtonXem_Click" 
        Text="Xem chi tiết" />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="MAVOUCHER" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="MAVOUCHER" HeaderText="MAVOUCHER" ReadOnly="True" 
                SortExpression="MAVOUCHER" />
            <asp:BoundField DataField="TENVOUCHER" HeaderText="TENVOUCHER" 
                SortExpression="TENVOUCHER" />
            <asp:BoundField DataField="THOIGIANBDKM" HeaderText="THOIGIANBDKM" 
                SortExpression="THOIGIANBDKM" />
            <asp:BoundField DataField="THOIGIANKTKM" HeaderText="THOIGIANKTKM" 
                SortExpression="THOIGIANKTKM" />
            <asp:BoundField DataField="NOIDUNG" HeaderText="NOIDUNG" 
                SortExpression="NOIDUNG" />
            <asp:BoundField DataField="GIAGOC" HeaderText="GIAGOC" 
                SortExpression="GIAGOC" />
            <asp:BoundField DataField="GIAKHUYENMAI" HeaderText="GIAKHUYENMAI" 
                SortExpression="GIAKHUYENMAI" />
            <asp:BoundField DataField="SOLUONGTRONGKHO" HeaderText="SOLUONGTRONGKHO" 
                SortExpression="SOLUONGTRONGKHO" />
            <asp:BoundField DataField="SOLUONGDAMUA" HeaderText="SOLUONGDAMUA" 
                SortExpression="SOLUONGDAMUA" />
            <asp:BoundField DataField="THUOCTINHVIP" HeaderText="THUOCTINHVIP" 
                SortExpression="THUOCTINHVIP" />
            <asp:BoundField DataField="TONGSOGIOBAN" HeaderText="TONGSOGIOBAN" 
                SortExpression="TONGSOGIOBAN" />
            <asp:BoundField DataField="TRANGTHAIDUYET" HeaderText="TRANGTHAIDUYET" 
                SortExpression="TRANGTHAIDUYET" />
            <asp:BoundField DataField="MAHINH" HeaderText="MAHINH" 
                SortExpression="MAHINH" />
            <asp:BoundField DataField="MALOAIVOUCHER" HeaderText="MALOAIVOUCHER" 
                SortExpression="MALOAIVOUCHER" />
            <asp:BoundField DataField="MAKHUVUC" HeaderText="MAKHUVUC" 
                SortExpression="MAKHUVUC" />
            <asp:BoundField DataField="MADOANHNGHIEP" HeaderText="MADOANHNGHIEP" 
                SortExpression="MADOANHNGHIEP" />
            <asp:BoundField DataField="ISAVAILABLE" HeaderText="ISAVAILABLE" 
                SortExpression="ISAVAILABLE" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:MuaChungConnectionString %>" 
        SelectCommand="SELECT * FROM [Voucher] WHERE ([MAVOUCHER] = @MAVOUCHER)">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" Name="MAVOUCHER" PropertyName="Text" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:Button ID="ButtonDelete" runat="server" onclick="ButtonDelete_Click" 
        Text="Xóa!" />
</asp:Content>
