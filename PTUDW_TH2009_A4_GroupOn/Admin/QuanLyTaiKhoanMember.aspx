﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="QuanLyTaiKhoanMember.aspx.cs" Inherits="PTUDW_TH2009_A4_GroupOn.Admin.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server">
    <asp:HyperLink ID="HyperLink1" runat="server" 
        NavigateUrl="~/Admin/ThemKhachHang.aspx">Thêm khách hàng</asp:HyperLink>
    <br />
    <br />
    <asp:Label ID="Label1" runat="server" Text="Thông tin tài khoản"></asp:Label>
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
        DataKeyNames="USERNAME" DataSourceID="SqlDataSource1" ForeColor="#333333" 
        GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                ShowSelectButton="True" />
            <asp:BoundField DataField="USERNAME" HeaderText="USERNAME" ReadOnly="True" 
                SortExpression="USERNAME" />
            <asp:BoundField DataField="PASSWORD" HeaderText="PASSWORD" 
                SortExpression="PASSWORD" />
            <asp:BoundField DataField="MAKH" HeaderText="MAKH" SortExpression="MAKH" />
            <asp:BoundField DataField="TKISAVAILABLE" HeaderText="TKISAVAILABLE" 
                SortExpression="TKISAVAILABLE" />
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
        ConflictDetection="CompareAllValues" 
        ConnectionString="<%$ ConnectionStrings:MuaChungConnectionString %>" 
        DeleteCommand="DELETE FROM [TAIKHOAN] WHERE [USERNAME] = @original_USERNAME AND [PASSWORD] = @original_PASSWORD AND [TKISAVAILABLE] = @original_TKISAVAILABLE AND (([MAKH] = @original_MAKH) OR ([MAKH] IS NULL AND @original_MAKH IS NULL))" 
        InsertCommand="INSERT INTO [TAIKHOAN] ([USERNAME], [PASSWORD], [TKISAVAILABLE], [MAKH]) VALUES (@USERNAME, @PASSWORD, @TKISAVAILABLE, @MAKH)" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT [USERNAME], [PASSWORD], [TKISAVAILABLE], [MAKH] FROM [TAIKHOAN] WHERE ([MAKH] IS NOT NULL)" 
        UpdateCommand="UPDATE [TAIKHOAN] SET [PASSWORD] = @PASSWORD, [TKISAVAILABLE] = @TKISAVAILABLE, [MAKH] = @MAKH WHERE [USERNAME] = @original_USERNAME AND [PASSWORD] = @original_PASSWORD AND [TKISAVAILABLE] = @original_TKISAVAILABLE AND (([MAKH] = @original_MAKH) OR ([MAKH] IS NULL AND @original_MAKH IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_USERNAME" Type="String" />
            <asp:Parameter Name="original_PASSWORD" Type="String" />
            <asp:Parameter Name="original_TKISAVAILABLE" Type="Int32" />
            <asp:Parameter Name="original_MAKH" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="USERNAME" Type="String" />
            <asp:Parameter Name="PASSWORD" Type="String" />
            <asp:Parameter Name="TKISAVAILABLE" Type="Int32" />
            <asp:Parameter Name="MAKH" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="PASSWORD" Type="String" />
            <asp:Parameter Name="TKISAVAILABLE" Type="Int32" />
            <asp:Parameter Name="MAKH" Type="Int32" />
            <asp:Parameter Name="original_USERNAME" Type="String" />
            <asp:Parameter Name="original_PASSWORD" Type="String" />
            <asp:Parameter Name="original_TKISAVAILABLE" Type="Int32" />
            <asp:Parameter Name="original_MAKH" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    <asp:Label ID="Label2" runat="server" Text="Chi tiết tài khoản"></asp:Label>
    <br />
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
        AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" CellPadding="4" 
        DataKeyNames="MAKH" DataSourceID="SqlDataSource2" ForeColor="#333333" 
        GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="MAKH" HeaderText="MAKH" ReadOnly="True" 
                SortExpression="MAKH" />
            <asp:BoundField DataField="DIACHI" HeaderText="DIACHI" 
                SortExpression="DIACHI" />
            <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" SortExpression="EMAIL" />
            <asp:BoundField DataField="SDT" HeaderText="SDT" SortExpression="SDT" />
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
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConflictDetection="CompareAllValues" 
        ConnectionString="<%$ ConnectionStrings:MuaChungConnectionString %>" 
        DeleteCommand="DELETE FROM [TaiKhoanThuong] WHERE [MAKH] = @original_MAKH AND [DIACHI] = @original_DIACHI AND [EMAIL] = @original_EMAIL AND [SDT] = @original_SDT" 
        InsertCommand="INSERT INTO [TaiKhoanThuong] ([MAKH], [DIACHI], [EMAIL], [SDT]) VALUES (@MAKH, @DIACHI, @EMAIL, @SDT)" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT * FROM [TaiKhoanThuong]" 
        UpdateCommand="UPDATE [TaiKhoanThuong] SET [DIACHI] = @DIACHI, [EMAIL] = @EMAIL, [SDT] = @SDT WHERE [MAKH] = @original_MAKH AND [DIACHI] = @original_DIACHI AND [EMAIL] = @original_EMAIL AND [SDT] = @original_SDT">
        <DeleteParameters>
            <asp:Parameter Name="original_MAKH" Type="Int32" />
            <asp:Parameter Name="original_DIACHI" Type="String" />
            <asp:Parameter Name="original_EMAIL" Type="String" />
            <asp:Parameter Name="original_SDT" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="MAKH" Type="Int32" />
            <asp:Parameter Name="DIACHI" Type="String" />
            <asp:Parameter Name="EMAIL" Type="String" />
            <asp:Parameter Name="SDT" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="DIACHI" Type="String" />
            <asp:Parameter Name="EMAIL" Type="String" />
            <asp:Parameter Name="SDT" Type="String" />
            <asp:Parameter Name="original_MAKH" Type="Int32" />
            <asp:Parameter Name="original_DIACHI" Type="String" />
            <asp:Parameter Name="original_EMAIL" Type="String" />
            <asp:Parameter Name="original_SDT" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </form>
</asp:Content>
