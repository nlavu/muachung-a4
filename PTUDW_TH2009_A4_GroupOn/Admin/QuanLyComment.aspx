<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="QuanLyComment.aspx.cs" Inherits="PTUDW_TH2009_A4_GroupOn.Admin.WebForm9" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server">
    <asp:Label ID="Label1" runat="server" Text="Quản lý comment"></asp:Label>
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
        DataKeyNames="THOIGIAN,TKCOMMENT,MAVOUCHERCOMMENT" 
        DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" />
            <asp:BoundField DataField="MAVOUCHERCOMMENT" HeaderText="Mã voucher" 
                ReadOnly="True" SortExpression="MAVOUCHERCOMMENT" />
            <asp:BoundField DataField="TKCOMMENT" HeaderText="Tài khoản đã comment" 
                ReadOnly="True" SortExpression="TKCOMMENT" />
            <asp:BoundField DataField="THOIGIAN" HeaderText="Thời gian comment" 
                ReadOnly="True" SortExpression="THOIGIAN" />
            <asp:BoundField DataField="NOIDUNG" HeaderText="Nội dung" 
                SortExpression="NOIDUNG" />
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
        DeleteCommand="DELETE FROM [Comment] WHERE [THOIGIAN] = @original_THOIGIAN AND [TKCOMMENT] = @original_TKCOMMENT AND [MAVOUCHERCOMMENT] = @original_MAVOUCHERCOMMENT AND [NOIDUNG] = @original_NOIDUNG" 
        InsertCommand="INSERT INTO [Comment] ([NOIDUNG], [THOIGIAN], [TKCOMMENT], [MAVOUCHERCOMMENT]) VALUES (@NOIDUNG, @THOIGIAN, @TKCOMMENT, @MAVOUCHERCOMMENT)" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT * FROM [Comment]" 
        UpdateCommand="UPDATE [Comment] SET [NOIDUNG] = @NOIDUNG WHERE [THOIGIAN] = @original_THOIGIAN AND [TKCOMMENT] = @original_TKCOMMENT AND [MAVOUCHERCOMMENT] = @original_MAVOUCHERCOMMENT AND [NOIDUNG] = @original_NOIDUNG">
        <DeleteParameters>
            <asp:Parameter Name="original_THOIGIAN" Type="DateTime" />
            <asp:Parameter Name="original_TKCOMMENT" Type="String" />
            <asp:Parameter Name="original_MAVOUCHERCOMMENT" Type="Int32" />
            <asp:Parameter Name="original_NOIDUNG" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="NOIDUNG" Type="String" />
            <asp:Parameter Name="THOIGIAN" Type="DateTime" />
            <asp:Parameter Name="TKCOMMENT" Type="String" />
            <asp:Parameter Name="MAVOUCHERCOMMENT" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="NOIDUNG" Type="String" />
            <asp:Parameter Name="original_THOIGIAN" Type="DateTime" />
            <asp:Parameter Name="original_TKCOMMENT" Type="String" />
            <asp:Parameter Name="original_MAVOUCHERCOMMENT" Type="Int32" />
            <asp:Parameter Name="original_NOIDUNG" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </form>
</asp:Content>
