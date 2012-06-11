using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PTUDW_TH2009_A4_GroupOn.DTO;
using PTUDW_TH2009_A4_GroupOn.DAO;

namespace PTUDW_TH2009_A4_GroupOn.DoanhNghiep
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                VoucherDAO voucher = new VoucherDAO();
                List<VoucherDTO> arrDeal = (List<VoucherDTO>)voucher.SelectVoucher_DoanhNghiep(int.Parse(Session["MaDN"].ToString()));

                RepeaterDSDealDN.DataSource = arrDeal.ToList();
                RepeaterDSDealDN.DataBind();
            }
        }
    }
}