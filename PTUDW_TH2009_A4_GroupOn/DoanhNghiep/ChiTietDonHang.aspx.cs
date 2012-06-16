using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PTUDW_TH2009_A4_GroupOn.DTO;
using PTUDW_TH2009_A4_GroupOn.DAO;
using PTUDW_TH2009_A4_GroupOn.BUS;

namespace PTUDW_TH2009_A4_GroupOn.DoanhNghiep
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int madn = int.Parse(Session["MaDN"].ToString());
            if (int.Parse(Session["IsLogin"].ToString()) == 1)
            {
                if (!Page.IsPostBack)
                {
                    VoucherDAO vDAO = new VoucherDAO();
                    List<VoucherDTO> lstVoucher = new List<VoucherDTO>();
                    lstVoucher = VoucherBUS.SelectVoucher_DoanhNghiep(madn);

                    ChiTietDonHangDAO ctDAO = new ChiTietDonHangDAO();
                    List<ChiTietDonHangDTO> lstCT = new List<ChiTietDonHangDTO>();
                    lstCT = ctDAO.SelectAllChiTietDonHang();

                    List<VoucherDTO> lstVoucherddl = new List<VoucherDTO>();

                    for (int i = 0; i < lstVoucher.Count; i++)
                        for (int j = 0; j < lstCT.Count; j++)
                            if (lstVoucher[i].MAVOUCHER1 == lstCT[j].VOUCHERDH1)
                                lstVoucherddl.Add(lstVoucher[i]);

                    ddlVoucherList.DataSource = lstVoucherddl;
                    ddlVoucherList.DataTextField = "TENVOUCHER1";
                    ddlVoucherList.DataValueField = "MAVOUCHER1";
                    ddlVoucherList.DataBind();
                }
            }
        }
    }
}