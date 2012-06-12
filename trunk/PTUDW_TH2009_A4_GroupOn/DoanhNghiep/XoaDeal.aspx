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
        DataKeyNames="MAVOUCHER" DataSourceID="SqlDataSource1" CellPadding="4" 
        ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="MAVOUCHER" HeaderText="Mã voucher" ReadOnly="True" 
                SortExpression="MAVOUCHER" />
            <asp:BoundField DataField="TENVOUCHER" HeaderText="Tên voucher" 
                SortExpression="TENVOUCHER" />
            <asp:BoundField DataField="THOIGIANBDKM" HeaderText="Thời gian bắt đầu khuyến mãi" 
                SortExpression="THOIGIANBDKM" />
            <asp:BoundField DataField="THOIGIANKTKM" HeaderText="Thời gian kết thúc khuyến mãi" 
                SortExpression="THOIGIANKTKM" />
            <asp:BoundField DataField="NOIDUNG" HeaderText="Nội dung" 
                SortExpression="NOIDUNG" />
            <asp:BoundField DataField="GIAGOC" HeaderText="Giá gốc" 
                SortExpression="GIAGOC" />
            <asp:BoundField DataField="GIAKHUYENMAI" HeaderText="Giá khuyến mãi" 
                SortExpression="GIAKHUYENMAI" />
            <asp:BoundField DataField="SOLUONGTRONGKHO" HeaderText="Số lượng trong kho" 
                SortExpression="SOLUONGTRONGKHO" />
            <asp:BoundField DataField="SOLUONGDAMUA" HeaderText="Số lượng đã mua" 
                SortExpression="SOLUONGDAMUA" />
            <asp:BoundField DataField="THUOCTINHVIP" HeaderText="VIP" 
                SortExpression="THUOCTINHVIP" />
            <asp:BoundField DataField="TONGSOGIOBAN" HeaderText="Tổng số giờ bán" 
                SortExpression="TONGSOGIOBAN" />
            <asp:BoundField DataField="TRANGTHAIDUYET" HeaderText="Trạng thái duyệt" 
                SortExpression="TRANGTHAIDUYET" />
            <asp:BoundField DataField="MAHINH" HeaderText="Mã hình" 
                SortExpression="MAHINH" />
            <asp:BoundField DataField="MALOAIVOUCHER" HeaderText="Mã loại voucher" 
                SortExpression="MALOAIVOUCHER" />
            <asp:BoundField DataField="MAKHUVUC" HeaderText="Mã khu vực" 
                SortExpression="MAKHUVUC" />
            <asp:BoundField DataField="MADOANHNGHIEP" HeaderText="Mã doanh nghiệp" 
                SortExpression="MADOANHNGHIEP" />
            <asp:BoundField DataField="ISAVAILABLE" HeaderText="AVAILABLE" 
                SortExpression="ISAVAILABLE" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
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
