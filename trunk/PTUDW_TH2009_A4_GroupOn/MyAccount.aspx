<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyAccount.aspx.cs" Inherits="PTUDW_TH2009_A4_GroupOn.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataKeyNames="USERNAME" DataSourceID="SqlDataSource1" 
        ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="USERNAME" HeaderText="USERNAME" ReadOnly="True" 
                SortExpression="USERNAME" />
            <asp:BoundField DataField="PASSWORD" HeaderText="PASSWORD" 
                SortExpression="PASSWORD" />
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
        DeleteCommand="DELETE FROM [TAIKHOAN] WHERE [USERNAME] = @original_USERNAME AND [PASSWORD] = @original_PASSWORD" 
        InsertCommand="INSERT INTO [TAIKHOAN] ([USERNAME], [PASSWORD]) VALUES (@USERNAME, @PASSWORD)" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT [USERNAME], [PASSWORD] FROM [TAIKHOAN] WHERE ([USERNAME] = @USERNAME)" 
        UpdateCommand="UPDATE [TAIKHOAN] SET [PASSWORD] = @PASSWORD WHERE [USERNAME] = @original_USERNAME AND [PASSWORD] = @original_PASSWORD">
        <DeleteParameters>
            <asp:Parameter Name="original_USERNAME" Type="String" />
            <asp:Parameter Name="original_PASSWORD" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="USERNAME" Type="String" />
            <asp:Parameter Name="PASSWORD" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="USERNAME" SessionField="logIn" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="PASSWORD" Type="String" />
            <asp:Parameter Name="original_USERNAME" Type="String" />
            <asp:Parameter Name="original_PASSWORD" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    </form>
</asp:Content>
