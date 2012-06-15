using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PTUDW_TH2009_A4_GroupOn.DAO;
using PTUDW_TH2009_A4_GroupOn.DTO;

namespace PTUDW_TH2009_A4_GroupOn.BUS
{
    public class VoucherBUS
    {
        public static List<VoucherDTO> SelectTop6TheoMaLoai(int maloai)
        {
            return VoucherDAO.SelectTop6TheoMaLoai(maloai);
        }

        public static VoucherDTO SelectVoucher_MaVoucher(int mavoucher)
        {
            return VoucherDAO.SelectVoucher_MaVoucher(mavoucher);
        }

        public static List<VoucherDTO> SelectAllVoucher()
        {
            return VoucherDAO.SelectAllVoucher();
        }
        public static List<VoucherDTO> SelectVoucher_DoanhNghiep(int madn)
        {
            return VoucherDAO.SelectVoucher_DoanhNghiep(madn);
        }
        public static List<VoucherDTO> SelectVoucher_KhuVuc(int kv)
        {
            return VoucherDAO.SelectVoucher_KhuVuc(kv);
        }
        public static List<VoucherDTO> SelectVoucher_Loai(int loai)
        {
            return VoucherDAO.SelectVoucher_Loai(loai);
        }
        public static List<VoucherDTO> SelectVoucher_Loai_KhuVuc(int loai, int khuvuc)
        {
            return VoucherDAO.SelectVoucher_Loai_KhuVuc(loai, khuvuc);
        }
        public static int InsertVoucher(VoucherDTO vc)
        {
            return VoucherDAO.InsertVoucher(vc);
        }
        public static int DeleteVoucher_DoanhNghiep(int madn)
        {
            return VoucherDAO.DeleteVoucher_DoanhNghiep(madn);
        }
        public static int DeleteVoucher_KhuVuc(int kv)
        {
            return VoucherDAO.DeleteVoucher_KhuVuc(kv);
        }
        public static int DeleteVoucher_Loai(int maloai)
        {
            return VoucherDAO.DeleteVoucher_Loai(maloai);

        }
        public static int DeleteVoucher_MaVoucher(int mavoucher)
        {
            return VoucherDAO.DeleteVoucher_MaVoucher(mavoucher);
        }
        public static int DeleteVoucher_NgayKetThuc(DateTime ngay)
        {
            return VoucherDAO.DeleteVoucher_NgayKetThuc(ngay);
        }
        public static int UpdateVoucher(VoucherDTO vc)
        {
            return VoucherDAO.UpdateVoucher(vc);
        }
        public static void TinhSoLuongDaMua(int madh)
        {
            VoucherDAO.TinhSoLuongDaMua(madh);
        }
    }
}