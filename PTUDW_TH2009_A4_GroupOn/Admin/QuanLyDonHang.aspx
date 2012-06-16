<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="QuanLyDonHang.aspx.cs" Inherits="PTUDW_TH2009_A4_GroupOn.Admin.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server">
    <asp:Label ID="Label1" runat="server" Text="Quản lý đơn hàng"></asp:Label>
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
        DataKeyNames="MADONHANG" DataSourceID="SqlDataSource1" ForeColor="#333333" 
        GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                ShowSelectButton="True" />
            <asp:BoundField DataField="MADONHANG" HeaderText="MADONHANG" ReadOnly="True" 
                SortExpression="MADONHANG" />
            <asp:BoundField DataField="TONGTIEN" HeaderText="TONGTIEN" 
                SortExpression="TONGTIEN" />
            <asp:BoundField DataField="NGAYMUA" HeaderText="NGAYMUA" 
                SortExpression="NGAYMUA" />
            <asp:BoundField DataField="TKUSERNAME" HeaderText="TKUSERNAME" 
                SortExpression="TKUSERNAME" />
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
        DeleteCommand="DELETE FROM [DonHang] WHERE [MADONHANG] = @original_MADONHANG AND [TONGTIEN] = @original_TONGTIEN AND [NGAYMUA] = @original_NGAYMUA AND [TKUSERNAME] = @original_TKUSERNAME" 
        InsertCommand="INSERT INTO [DonHang] ([MADONHANG], [TONGTIEN], [NGAYMUA], [TKUSERNAME]) VALUES (@MADONHANG, @TONGTIEN, @NGAYMUA, @TKUSERNAME)" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT * FROM [DonHang]" 
        UpdateCommand="UPDATE [DonHang] SET [TONGTIEN] = @TONGTIEN, [NGAYMUA] = @NGAYMUA, [TKUSERNAME] = @TKUSERNAME WHERE [MADONHANG] = @original_MADONHANG AND [TONGTIEN] = @original_TONGTIEN AND [NGAYMUA] = @original_NGAYMUA AND [TKUSERNAME] = @original_TKUSERNAME">
        <DeleteParameters>
            <asp:Parameter Name="original_MADONHANG" Type="Int32" />
            <asp:Parameter Name="original_TONGTIEN" Type="Int32" />
            <asp:Parameter Name="original_NGAYMUA" Type="DateTime" />
            <asp:Parameter Name="original_TKUSERNAME" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="MADONHANG" Type="Int32" />
            <asp:Parameter Name="TONGTIEN" Type="Int32" />
            <asp:Parameter Name="NGAYMUA" Type="DateTime" />
            <asp:Parameter Name="TKUSERNAME" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="TONGTIEN" Type="Int32" />
            <asp:Parameter Name="NGAYMUA" Type="DateTime" />
            <asp:Parameter Name="TKUSERNAME" Type="String" />
            <asp:Parameter Name="original_MADONHANG" Type="Int32" />
            <asp:Parameter Name="original_TONGTIEN" Type="Int32" />
            <asp:Parameter Name="original_NGAYMUA" Type="DateTime" />
            <asp:Parameter Name="original_TKUSERNAME" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <asp:Label ID="Label2" runat="server" Text="Chi tiết đơn hàng được chọn ở trên"></asp:Label>
    <br />
    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
        DataKeyNames="LANGIAOHANGTHU,MADH,VOUCHERDH" DataSourceID="SqlDataSource2" 
        ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="SOLUONGMUA" HeaderText="SOLUONGMUA" 
                SortExpression="SOLUONGMUA" />
            <asp:BoundField DataField="TRANGTHAIGIAOHANG" HeaderText="TRANGTHAIGIAOHANG" 
                SortExpression="TRANGTHAIGIAOHANG" />
            <asp:BoundField DataField="TRANGTHAISUDUNG" HeaderText="TRANGTHAISUDUNG" 
                SortExpression="TRANGTHAISUDUNG" />
            <asp:BoundField DataField="LANGIAOHANGTHU" HeaderText="LANGIAOHANGTHU" 
                ReadOnly="True" SortExpression="LANGIAOHANGTHU" />
            <asp:BoundField DataField="NGAYGIAOHANG" HeaderText="NGAYGIAOHANG" 
                SortExpression="NGAYGIAOHANG" />
            <asp:BoundField DataField="MADH" HeaderText="MADH" ReadOnly="True" 
                SortExpression="MADH" />
            <asp:BoundField DataField="VOUCHERDH" HeaderText="VOUCHERDH" ReadOnly="True" 
                SortExpression="VOUCHERDH" />
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
        DeleteCommand="DELETE FROM [ChiTietDonHang] WHERE [LANGIAOHANGTHU] = @original_LANGIAOHANGTHU AND [MADH] = @original_MADH AND [VOUCHERDH] = @original_VOUCHERDH AND [SOLUONGMUA] = @original_SOLUONGMUA AND [TRANGTHAIGIAOHANG] = @original_TRANGTHAIGIAOHANG AND [TRANGTHAISUDUNG] = @original_TRANGTHAISUDUNG AND [NGAYGIAOHANG] = @original_NGAYGIAOHANG" 
        InsertCommand="INSERT INTO [ChiTietDonHang] ([SOLUONGMUA], [TRANGTHAIGIAOHANG], [TRANGTHAISUDUNG], [LANGIAOHANGTHU], [NGAYGIAOHANG], [MADH], [VOUCHERDH]) VALUES (@SOLUONGMUA, @TRANGTHAIGIAOHANG, @TRANGTHAISUDUNG, @LANGIAOHANGTHU, @NGAYGIAOHANG, @MADH, @VOUCHERDH)" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT * FROM [ChiTietDonHang] WHERE ([MADH] = @MADH)" 
        UpdateCommand="UPDATE [ChiTietDonHang] SET [SOLUONGMUA] = @SOLUONGMUA, [TRANGTHAIGIAOHANG] = @TRANGTHAIGIAOHANG, [TRANGTHAISUDUNG] = @TRANGTHAISUDUNG, [NGAYGIAOHANG] = @NGAYGIAOHANG WHERE [LANGIAOHANGTHU] = @original_LANGIAOHANGTHU AND [MADH] = @original_MADH AND [VOUCHERDH] = @original_VOUCHERDH AND [SOLUONGMUA] = @original_SOLUONGMUA AND [TRANGTHAIGIAOHANG] = @original_TRANGTHAIGIAOHANG AND [TRANGTHAISUDUNG] = @original_TRANGTHAISUDUNG AND [NGAYGIAOHANG] = @original_NGAYGIAOHANG">
        <DeleteParameters>
            <asp:Parameter Name="original_LANGIAOHANGTHU" Type="Int32" />
            <asp:Parameter Name="original_MADH" Type="Int32" />
            <asp:Parameter Name="original_VOUCHERDH" Type="Int32" />
            <asp:Parameter Name="original_SOLUONGMUA" Type="Int32" />
            <asp:Parameter Name="original_TRANGTHAIGIAOHANG" Type="String" />
            <asp:Parameter Name="original_TRANGTHAISUDUNG" Type="String" />
            <asp:Parameter Name="original_NGAYGIAOHANG" Type="DateTime" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="SOLUONGMUA" Type="Int32" />
            <asp:Parameter Name="TRANGTHAIGIAOHANG" Type="String" />
            <asp:Parameter Name="TRANGTHAISUDUNG" Type="String" />
            <asp:Parameter Name="LANGIAOHANGTHU" Type="Int32" />
            <asp:Parameter Name="NGAYGIAOHANG" Type="DateTime" />
            <asp:Parameter Name="MADH" Type="Int32" />
            <asp:Parameter Name="VOUCHERDH" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="MADH" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="SOLUONGMUA" Type="Int32" />
            <asp:Parameter Name="TRANGTHAIGIAOHANG" Type="String" />
            <asp:Parameter Name="TRANGTHAISUDUNG" Type="String" />
            <asp:Parameter Name="NGAYGIAOHANG" Type="DateTime" />
            <asp:Parameter Name="original_LANGIAOHANGTHU" Type="Int32" />
            <asp:Parameter Name="original_MADH" Type="Int32" />
            <asp:Parameter Name="original_VOUCHERDH" Type="Int32" />
            <asp:Parameter Name="original_SOLUONGMUA" Type="Int32" />
            <asp:Parameter Name="original_TRANGTHAIGIAOHANG" Type="String" />
            <asp:Parameter Name="original_TRANGTHAISUDUNG" Type="String" />
            <asp:Parameter Name="original_NGAYGIAOHANG" Type="DateTime" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </form>
</asp:Content>
