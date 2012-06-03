using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PTUDW_TH2009_A4_GroupOn.DTO;
using PTUDW_TH2009_A4_GroupOn.DAO;

namespace PTUDW_TH2009_A4_GroupOn
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonLogin_Click(object sender, EventArgs e)
        {
            TaiKhoanDAO tkDao = new TaiKhoanDAO();
            List<TaiKhoanDTO> tk = tkDao.SelectTaiKhoan_Username(TextBoxUsername.Text);
            Label1.Text = tk[0].PASSWORD1;
            if (tk[0].PASSWORD1 == TextBoxPassword.Text)
                Label1.Text = "dung";
        }
    }
}