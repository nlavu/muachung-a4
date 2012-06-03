<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DNDangNhap.aspx.cs" Inherits="PTUDW_TH2009_A4_GroupOn.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: 228px">
        <asp:Label ID="txtUsername" runat="server" Text="Username"></asp:Label>
        <asp:TextBox ID="TextBoxUsername" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
        <asp:TextBox ID="TextBoxPassword" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="ButtonLogin" runat="server" onclick="ButtonLogin_Click" 
            Text="Login" />
    </div>
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </form>
</body>
</html>
