<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="QuanLyTaiKhoanMember.aspx.cs" Inherits="PTUDW_TH2009_A4_GroupOn.Admin.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server">
    <asp:Label ID="Label1" runat="server" Text="Thông tin tài khoản"></asp:Label>
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
        DataKeyNames="USERNAME" DataSourceID="SqlDataSource1" ForeColor="#333333" 
        GridLines="None" AutoGenerateEditButton="True" 
        AutoGenerateSelectButton="True">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="USERNAME" HeaderText="USERNAME" ReadOnly="True" 
                SortExpression="USERNAME" />
            <asp:BoundField DataField="PASSWORD" HeaderText="PASSWORD" 
                SortExpression="PASSWORD" />
            <asp:BoundField DataField="MADN" HeaderText="MADN" 
                SortExpression="MADN" />
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
        DeleteCommand="DELETE FROM [TAIKHOAN] WHERE [USERNAME] = @original_USERNAME AND [PASSWORD] = @original_PASSWORD AND (([MADN] = @original_MADN) OR ([MADN] IS NULL AND @original_MADN IS NULL)) AND [TKISAVAILABLE] = @original_TKISAVAILABLE" 
        InsertCommand="INSERT INTO [TAIKHOAN] ([USERNAME], [PASSWORD], [MADN], [TKISAVAILABLE]) VALUES (@USERNAME, @PASSWORD, @MADN, @TKISAVAILABLE)" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT [USERNAME], [PASSWORD], [MADN], [TKISAVAILABLE] FROM [TAIKHOAN] WHERE ([MADN] IS NOT NULL)" 
        
        UpdateCommand="UPDATE [TAIKHOAN] SET [PASSWORD] = @PASSWORD, [MADN] = @MADN, [TKISAVAILABLE] = @TKISAVAILABLE WHERE [USERNAME] = @original_USERNAME AND [PASSWORD] = @original_PASSWORD AND (([MADN] = @original_MADN) OR ([MADN] IS NULL AND @original_MADN IS NULL)) AND [TKISAVAILABLE] = @original_TKISAVAILABLE">
        <DeleteParameters>
            <asp:Parameter Name="original_USERNAME" Type="String" />
            <asp:Parameter Name="original_PASSWORD" Type="String" />
            <asp:Parameter Name="original_MADN" Type="Int32" />
            <asp:Parameter Name="original_TKISAVAILABLE" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="USERNAME" Type="String" />
            <asp:Parameter Name="PASSWORD" Type="String" />
            <asp:Parameter Name="MADN" Type="Int32" />
            <asp:Parameter Name="TKISAVAILABLE" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="PASSWORD" Type="String" />
            <asp:Parameter Name="MADN" Type="Int32" />
            <asp:Parameter Name="TKISAVAILABLE" Type="Int32" />
            <asp:Parameter Name="original_USERNAME" Type="String" />
            <asp:Parameter Name="original_PASSWORD" Type="String" />
            <asp:Parameter Name="original_MADN" Type="Int32" />
            <asp:Parameter Name="original_TKISAVAILABLE" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    <asp:Label ID="Label2" runat="server" Text="Chi tiết tài khoản"></asp:Label>
    <br />
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
        AutoGenerateEditButton="True" CellPadding="4" 
        DataKeyNames="MADN" DataSourceID="SqlDataSource2" ForeColor="#333333" 
        GridLines="None" AllowPaging="True" AllowSorting="True">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="MADN" HeaderText="MADN" ReadOnly="True" 
                SortExpression="MADN" />
            <asp:BoundField DataField="TENDN" HeaderText="TENDN" 
                SortExpression="TENDN" />
            <asp:BoundField DataField="SDTDN" HeaderText="SDTDN" SortExpression="SDTDN" />
            <asp:BoundField DataField="GIOITHIEU" HeaderText="GIOITHIEU" 
                SortExpression="GIOITHIEU" />
            <asp:BoundField DataField="WEBSITE" HeaderText="WEBSITE" 
                SortExpression="WEBSITE" />
            <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" SortExpression="EMAIL" />
            <asp:BoundField DataField="KINHDO" HeaderText="KINHDO" 
                SortExpression="KINHDO" />
            <asp:BoundField DataField="VIDO" HeaderText="VIDO" SortExpression="VIDO" />
            <asp:BoundField DataField="MADIACHIDN" HeaderText="MADIACHIDN" 
                SortExpression="MADIACHIDN" />
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
        DeleteCommand="DELETE FROM [TaiKhoanDoanhNghiep] WHERE [MADN] = @original_MADN AND [TENDN] = @original_TENDN AND [SDTDN] = @original_SDTDN AND [GIOITHIEU] = @original_GIOITHIEU AND [WEBSITE] = @original_WEBSITE AND [EMAIL] = @original_EMAIL AND [KINHDO] = @original_KINHDO AND [VIDO] = @original_VIDO AND [MADIACHIDN] = @original_MADIACHIDN" 
        InsertCommand="INSERT INTO [TaiKhoanDoanhNghiep] ([MADN], [TENDN], [SDTDN], [GIOITHIEU], [WEBSITE], [EMAIL], [KINHDO], [VIDO], [MADIACHIDN]) VALUES (@MADN, @TENDN, @SDTDN, @GIOITHIEU, @WEBSITE, @EMAIL, @KINHDO, @VIDO, @MADIACHIDN)" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT * FROM [TaiKhoanDoanhNghiep]" 
        
        UpdateCommand="UPDATE [TaiKhoanDoanhNghiep] SET [TENDN] = @TENDN, [SDTDN] = @SDTDN, [GIOITHIEU] = @GIOITHIEU, [WEBSITE] = @WEBSITE, [EMAIL] = @EMAIL, [KINHDO] = @KINHDO, [VIDO] = @VIDO, [MADIACHIDN] = @MADIACHIDN WHERE [MADN] = @original_MADN AND [TENDN] = @original_TENDN AND [SDTDN] = @original_SDTDN AND [GIOITHIEU] = @original_GIOITHIEU AND [WEBSITE] = @original_WEBSITE AND [EMAIL] = @original_EMAIL AND [KINHDO] = @original_KINHDO AND [VIDO] = @original_VIDO AND [MADIACHIDN] = @original_MADIACHIDN">
        <DeleteParameters>
            <asp:Parameter Name="original_MADN" Type="Int32" />
            <asp:Parameter Name="original_TENDN" Type="String" />
            <asp:Parameter Name="original_SDTDN" Type="String" />
            <asp:Parameter Name="original_GIOITHIEU" Type="String" />
            <asp:Parameter Name="original_WEBSITE" Type="String" />
            <asp:Parameter Name="original_EMAIL" Type="String" />
            <asp:Parameter Name="original_KINHDO" Type="String" />
            <asp:Parameter Name="original_VIDO" Type="String" />
            <asp:Parameter Name="original_MADIACHIDN" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="MADN" Type="Int32" />
            <asp:Parameter Name="TENDN" Type="String" />
            <asp:Parameter Name="SDTDN" Type="String" />
            <asp:Parameter Name="GIOITHIEU" Type="String" />
            <asp:Parameter Name="WEBSITE" Type="String" />
            <asp:Parameter Name="EMAIL" Type="String" />
            <asp:Parameter Name="KINHDO" Type="String" />
            <asp:Parameter Name="VIDO" Type="String" />
            <asp:Parameter Name="MADIACHIDN" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="TENDN" Type="String" />
            <asp:Parameter Name="SDTDN" Type="String" />
            <asp:Parameter Name="GIOITHIEU" Type="String" />
            <asp:Parameter Name="WEBSITE" Type="String" />
            <asp:Parameter Name="EMAIL" Type="String" />
            <asp:Parameter Name="KINHDO" Type="String" />
            <asp:Parameter Name="VIDO" Type="String" />
            <asp:Parameter Name="MADIACHIDN" Type="Int32" />
            <asp:Parameter Name="original_MADN" Type="Int32" />
            <asp:Parameter Name="original_TENDN" Type="String" />
            <asp:Parameter Name="original_SDTDN" Type="String" />
            <asp:Parameter Name="original_GIOITHIEU" Type="String" />
            <asp:Parameter Name="original_WEBSITE" Type="String" />
            <asp:Parameter Name="original_EMAIL" Type="String" />
            <asp:Parameter Name="original_KINHDO" Type="String" />
            <asp:Parameter Name="original_VIDO" Type="String" />
            <asp:Parameter Name="original_MADIACHIDN" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </form>
</asp:Content>
