using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using PTUDW_TH2009_A4_GroupOn.DTO;
using PTUDW_TH2009_A4_GroupOn.BUS;

namespace PTUDW_TH2009_A4_GroupOn
{
    public partial class MasterPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Redirect("./Default.aspx");
        }

        // kiem tra tinh trang
        [WebMethod(EnableSession = true)]
        public static string KiemTraTrangThai()
        {
            string result = "";

            try
            {
                string res = HttpContext.Current.Session["logIn"].ToString();

                if (res != "")
                {
                    result = HttpContext.Current.Session["logIn"].ToString();
                }

                return result;
            }
            catch (Exception ex)
            {
                return result;
            }
        }



        // xu li dang xuat
        [WebMethod(EnableSession = true)]
        public static string DangXuat()
        {
            string res = "";

            try
            {
                HttpContext.Current.Session["logIn"] = null;
                res = "false";

                return res;
            }
            catch (Exception ex)
            {
                return res;
            }
        }


        // xu li dang nhap
        [WebMethod(EnableSession = true)]
        public static string XuLiDangNhap(string Username, string Password)
        {
            //int maTaiKhoan = "";
            string tenTaiKhoan = "";

            try
            {
                //tenTaiKhoan = TaiKhoanBUS.KiemTraTaiKhoanHopLe(Username, Password);

                //if (tenTaiKhoan != "-1")
                //{
                HttpContext.Current.Session["logIn"] = Username.ToString();
                tenTaiKhoan = Username;
                    //tenTaiKhoan = TaiKhoanBUS.LayTenTaiKhoan(int.Parse(maTaiKhoan));
               // }

                return tenTaiKhoan;
            }
            catch (Exception ex)
            {
                return tenTaiKhoan;
            }
        }


        // xu li dang ki
       /* [WebMethod(EnableSession = true)]
        public static string XuLiDangKi(string Username, string Password, string Companyname, string Email)
        {
            string result = "-1";

            try
            {
                result = TaiKhoanBUS.XuLiDangKi(Username, Password, Companyname, Email);

                if (result != "-1" && result != "0")
                    HttpContext.Current.Session["logIn"] = result.ToString();

                return result;
            }
            catch (Exception ex)
            {
                return result;
            }
        }*/

    }
}