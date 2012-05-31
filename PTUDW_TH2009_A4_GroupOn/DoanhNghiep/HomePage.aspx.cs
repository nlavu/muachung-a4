using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PTUDW_TH2009_A4_GroupOn.DAO;
using PTUDW_TH2009_A4_GroupOn.DTO;

namespace PTUDW_TH2009_A4_GroupOn.DoanhNghiep
{
    public partial class HomePage : System.Web.UI.Page
    {
        public static VoucherDAO voucher = new VoucherDAO();
        public static List<VoucherDTO> lstVoucher = new List<VoucherDTO>();
        protected void Page_Load(object sender, EventArgs e)
        {
            lstVoucher = voucher.SelectAllVoucher().ToList();
        }
    }
}