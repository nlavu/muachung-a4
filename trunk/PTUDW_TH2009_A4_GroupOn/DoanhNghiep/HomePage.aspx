<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="PTUDW_TH2009_A4_GroupOn.DoanhNghiep.HomePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="middle-box-white">
    <div class="">
        <div class="left">
            <i class="title_order">Danh sách DEAL</i>
        </div>
        <!--end left .-->
        <div class="clear"></div>
    </div>
    <!--end .middle-box-title-->    
    <asp:Panel ID="pnlKetQuaThem" runat="server">
        <div style="margin: 20px 0 0px;">
            <asp:Label ID="lblKetQuaThem" runat="server" Font-Size="18px" >
            </asp:Label>
        </div>
    </asp:Panel>
    <!--kết quả thêm doanh nghiệp-->
    <asp:Panel ID="pnlThemDoanhNghiep" runat="server">
    <div class="middle-box-content">
        <table width="100%" border="0" class="table-1">
            <tr>
                <th class="text-normal">STT</th>
                <th class="text-normal"> Tên sản phẩm</th>
                <th class="text-normal"> Giá bán</th>
                <th class="text-normal"> Số lượng còn lại</th>
                <th class="text-normal"> Ngày hết hạn</th>
                <th class="text-normal"> Tình trạng</th>
                <th class="text-normal">&nbsp;</th>
            </tr>
            <% if (lstVoucher.Count > 0)
               {
                   for (int i = 0; i < lstVoucher.Count; i++)
                   {
                       string tinhTrang = String.Empty;
                       string button = String.Empty;
                       if (lstVoucher[i].THOIGIANKTKM1.CompareTo(DateTime.Now) <= 0)
                       {
                           tinhTrang = "Hết hạn";
                           button = "<a href='ThanhLyHopDong.aspx?maSanPham=" + lstVoucher[i].MAVOUCHER1
                               + "'>Thanh lý hợp đồng</a>";
                       }
                       else
                       {
                           tinhTrang = "Đang chạy";
                       }
                       %>
                       <tr>
                            <td class="text-normal"><%=i + 1 %></td>
                            <td ><%=lstVoucher[i].TENVOUCHER1 %></td>
                            <td class="text-number"><%=lstVoucher[i].GIAKHUYENMAI1.ToString("#,##0") %> VNĐ</td>
                            <td class="text-number"><%=lstVoucher[i].SOLUONGTRONGKHO1.ToString() %></td>
                            <td><%=lstVoucher[i].THOIGIANKTKM1 %></td>
                            <td class="text-normal"><%=tinhTrang %></td>
                            <td class="text-normal"><%=button %></td>
                        </tr>
                       <%
                   }
               } %>
            
        </table>
               
    </div>
    <!--end .middle-box-content-->
    </asp:Panel>
</div>
<!--end .middle-box-white-->

</asp:Content>
