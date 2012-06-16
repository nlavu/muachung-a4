using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PTUDW_TH2009_A4_GroupOn.DTO;
using PTUDW_TH2009_A4_GroupOn.DAO;

namespace PTUDW_TH2009_A4_GroupOn.BUS
{
    public class TaiKhoanDoanhNghiepBUS
    {
        public static int laymadoanhnghieptheomavoucher(int mavoucher)
        {
            return TaiKhoanDoanhNghiepDAO.laymadoanhnghieptheomavoucher(mavoucher);
        }

        public static PTUDW_TH2009_A4_GroupOn.DTO.sp_LayDoanhNghiepTheoMadnResult laydoanhnghieptheomadn(int madn)
        {
            return TaiKhoanDoanhNghiepDAO.laydntheomadn(madn);
        }
    }
}