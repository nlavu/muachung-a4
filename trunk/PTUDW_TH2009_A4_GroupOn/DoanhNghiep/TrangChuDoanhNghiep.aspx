<%@ Page Title="" Language="C#" MasterPageFile="~/DoanhNghiep/DoanhNghiepSite.Master" AutoEventWireup="true" CodeBehind="TrangChuDoanhNghiep.aspx.cs" Inherits="PTUDW_TH2009_A4_GroupOn.DoanhNghiep.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Repeater ID="RepeaterDSDealDN" runat="server">
        <ItemTemplate>
            
            <div class="box-white-image">
                <a href='ChiTietDeal.aspx?mavoucher=<%# Eval("MAVOUCHER1")%>'>
                    Chi tiết sản phẩm <%# Eval("MAVOUCHER1")%>
                </a>
                
            </div>
            <!--end .box-white-image-->   
            
        </div>
        <!--end .box-white-text-->       
        
        <!--end .box-white-info-->     
        <div class="clear"></div>
                                
        </ItemTemplate>
    </asp:Repeater>
</asp:Content>
