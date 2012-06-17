using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PTUDW_TH2009_A4_GroupOn.DTO;
using PTUDW_TH2009_A4_GroupOn.DAO;

namespace PTUDW_TH2009_A4_GroupOn.BUS
{
    public class TaiKhoanThuongBUS
    {
        public static PTUDW_TH2009_A4_GroupOn.DTO.sp_laythongtinkhbangusernameResult laythongtinkh_username(string username)
        {
            return TaiKhoanThuongDAO.laythongtinkh_username(username);
        }
    }
}