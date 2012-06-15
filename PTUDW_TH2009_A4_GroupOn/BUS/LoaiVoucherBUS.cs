using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PTUDW_TH2009_A4_GroupOn.DAO;
using PTUDW_TH2009_A4_GroupOn.DTO;

namespace PTUDW_TH2009_A4_GroupOn.BUS
{
    public class LoaiVoucherBUS
    {
        public static List<LoaiVoucherDTO> LayDanhSachLoaiVoucher()
        {
            return LoaiVoucherDAO.SelectAllLoaiVoucher();
        }

        public static int InsertLoaiVoucher(LoaiVoucherDTO vc)
        {
            return LoaiVoucherDAO.InsertLoaiVoucher(vc);
        }

        public static int DelLoaiVoucher(int vc)
        {
            return LoaiVoucherDAO.DelLoaiVoucher(vc);
        }
        public static int UpdateLoaiVoucher(LoaiVoucherDTO vc)
        {
            return LoaiVoucherDAO.UpdateLoaiVoucher(vc);
        }

        public static int LaySoLuongVoucherTheoLoai(int maloai)
        {
            return LoaiVoucherDAO.LaySoLuongVoucherTheoLoai(maloai);
        }

    }
}