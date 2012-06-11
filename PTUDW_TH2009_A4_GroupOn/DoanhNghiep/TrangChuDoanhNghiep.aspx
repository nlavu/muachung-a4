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
            <div class="box-white-text">
            <h3>
                <a href='../ProductDetail.aspx'</a>
            </h3>
                <p> ThongTinMoTa </p>
            <p class="box-white-detail">
                <a name="Nhà Hàng Totoya" href='../ProductDetail.aspx> xem chi tiết</a>
            </p>
            <div>
                <span class="box-white-quote">
                </span>
            </div>
        </div>
        <!--end .box-white-text-->       
        <div class="box-white-info">
            <p>
                <strong> VNĐ</strong>
            </p>
            <p>
                <div>
                    <a href = '../ProductDetail.aspx' class="view-button button-green">Xem</a>
                </div>
            </p>
            <div class="box-white-info-sale">
                <div class="box-white-info-save">
                    <span class="number">GiamGia")</span>
                    <span>tiết kiệm</span>
                </div>
                <div class="box-white-info-buyer">
                    <span class="number">
                       SoNguoiMua
                    </span>
                    <span>người mua</span>
                </div>
                <div class="box-white-info-time">
                    <span id="Time_CountDown_2256" class="number">ThoiGianConLai</span>
                    <span>thời gian còn lại</span>
                </div>
                <div class="clear"></div>
            </div>
            <!--end box-white-info-sale-->
            <div class="box-white-info-price">
                <p>
                    Giá gốc:
                    <span><%# Eval("GIAGOC1")%></span>
                    VNĐ
                </p>
            </div>
            <!--end box-white-info-price-->
        </div>
        <!--end .box-white-info-->     
        <div class="clear"></div>
                                
        </ItemTemplate>
    </asp:Repeater>
</asp:Content>
