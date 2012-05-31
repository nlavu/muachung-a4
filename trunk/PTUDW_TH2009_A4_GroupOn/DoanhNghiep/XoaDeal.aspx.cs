﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PTUDW_TH2009_A4_GroupOn.DTO;
using PTUDW_TH2009_A4_GroupOn.DAO;

namespace PTUDW_TH2009_A4_GroupOn.DoanhNghiep
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ButtonDelete.Visible = false;
        }

        protected void ButtonDelete_Click(object sender, EventArgs e)
        {
            int ma = Int32.Parse(TextBox1.Text);
            VoucherDAO v = new VoucherDAO();
            v.DeleteVoucher_MaVoucher(ma);
        }

        protected void ButtonXem_Click(object sender, EventArgs e)
        {
            GridView1.Visible = true;
            ButtonDelete.Visible = true;
        }
    }
}