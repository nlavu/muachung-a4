<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="QuanLyDoanhNghiep.aspx.cs" Inherits="PTUDW_TH2009_A4_GroupOn.Admin.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server">
&nbsp;<asp:HyperLink ID="HyperLink1" runat="server" 
        NavigateUrl="~/Admin/ThemDoanhNghiep.aspx">Thêm doanh nghiệp mới</asp:HyperLink>
    <br />
    <br />
    <asp:Label ID="Label2" runat="server" Text="Thông tin doanh nghiệp"></asp:Label>
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
        DataKeyNames="MADN" DataSourceID="SqlDataSource1" ForeColor="#333333" 
        GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                ShowSelectButton="True" />
            <asp:BoundField DataField="MADN" HeaderText="Mã doanh nghiệp" ReadOnly="True" 
                SortExpression="MADN" />
            <asp:BoundField DataField="TENDN" HeaderText="Tên doanh nghiệp" 
                SortExpression="TENDN" />
            <asp:BoundField DataField="SDTDN" HeaderText="Số điện thoại" 
                SortExpression="SDTDN" />
            <asp:BoundField DataField="GIOITHIEU" HeaderText="Giới thiệu" 
                SortExpression="GIOITHIEU" />
            <asp:BoundField DataField="WEBSITE" HeaderText="Website" 
                SortExpression="WEBSITE" />
            <asp:BoundField DataField="EMAIL" HeaderText="Email" SortExpression="EMAIL" />
            <asp:BoundField DataField="KINHDO" HeaderText="Kinh do" 
                SortExpression="KINHDO" />
            <asp:BoundField DataField="VIDO" HeaderText="Vi do" SortExpression="VIDO" />
            <asp:BoundField DataField="MADIACHIDN" HeaderText="Mã địa chỉ" 
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConflictDetection="CompareAllValues" 
        ConnectionString="<%$ ConnectionStrings:MuaChungConnectionString %>" 
        DeleteCommand="DELETE FROM [TaiKhoanDoanhNghiep] WHERE [MADN] = @original_MADN AND [TENDN] = @original_TENDN AND [SDTDN] = @original_SDTDN AND [GIOITHIEU] = @original_GIOITHIEU AND [WEBSITE] = @original_WEBSITE AND [EMAIL] = @original_EMAIL AND [KINHDO] = @original_KINHDO AND [VIDO] = @original_VIDO AND [MADIACHIDN] = @original_MADIACHIDN" 
        InsertCommand="INSERT INTO [TaiKhoanDoanhNghiep] ([MADN], [TENDN], [SDTDN], [GIOITHIEU], [WEBSITE], [EMAIL], [KINHDO], [VIDO], [MADIACHIDN]) VALUES (@MADN, @TENDN, @SDTDN, @GIOITHIEU, @WEBSITE, @EMAIL, @KINHDO, @VIDO, @MADIACHIDN)" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT * FROM [TaiKhoanDoanhNghiep] ORDER BY [MADN]" 
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
    <br />
    <asp:Label ID="Label1" runat="server" Text="Chi tiết địa chỉ doanh nghiệp"></asp:Label>
    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
        DataKeyNames="MADC" DataSourceID="SqlDataSource2" ForeColor="#333333" 
        GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                ShowSelectButton="True" />
            <asp:BoundField DataField="MADC" HeaderText="Mã địa chỉ" ReadOnly="True" 
                SortExpression="MADC" />
            <asp:BoundField DataField="DC1" HeaderText="Địa chỉ 1" SortExpression="DC1" />
            <asp:BoundField DataField="DC2" HeaderText="Địa chỉ 2" SortExpression="DC2" />
            <asp:BoundField DataField="DC3" HeaderText="Địa chỉ 3" SortExpression="DC3" />
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
        DeleteCommand="DELETE FROM [DiaChiDoanhNghiep] WHERE [MADC] = @original_MADC AND [DC1] = @original_DC1 AND (([DC2] = @original_DC2) OR ([DC2] IS NULL AND @original_DC2 IS NULL)) AND (([DC3] = @original_DC3) OR ([DC3] IS NULL AND @original_DC3 IS NULL))" 
        InsertCommand="INSERT INTO [DiaChiDoanhNghiep] ([MADC], [DC1], [DC2], [DC3]) VALUES (@MADC, @DC1, @DC2, @DC3)" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT * FROM [DiaChiDoanhNghiep] WHERE ([MADC] = @MADC)" 
        UpdateCommand="UPDATE [DiaChiDoanhNghiep] SET [DC1] = @DC1, [DC2] = @DC2, [DC3] = @DC3 WHERE [MADC] = @original_MADC AND [DC1] = @original_DC1 AND (([DC2] = @original_DC2) OR ([DC2] IS NULL AND @original_DC2 IS NULL)) AND (([DC3] = @original_DC3) OR ([DC3] IS NULL AND @original_DC3 IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_MADC" Type="Int32" />
            <asp:Parameter Name="original_DC1" Type="String" />
            <asp:Parameter Name="original_DC2" Type="String" />
            <asp:Parameter Name="original_DC3" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="MADC" Type="Int32" />
            <asp:Parameter Name="DC1" Type="String" />
            <asp:Parameter Name="DC2" Type="String" />
            <asp:Parameter Name="DC3" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="MADC" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="DC1" Type="String" />
            <asp:Parameter Name="DC2" Type="String" />
            <asp:Parameter Name="DC3" Type="String" />
            <asp:Parameter Name="original_MADC" Type="Int32" />
            <asp:Parameter Name="original_DC1" Type="String" />
            <asp:Parameter Name="original_DC2" Type="String" />
            <asp:Parameter Name="original_DC3" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    </form>
</asp:Content>
