using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PTUDW_TH2009_A4_GroupOn.DTO;

namespace PTUDW_TH2009_A4_GroupOn.DAO
{
    public class DonHangDAO
    {
        private static DataClasses1DataContext data = new DataClasses1DataContext();
        public static List<DonHangDTO> SelectAllDonHang()
        {
            List<DonHangDTO> listDHDTO = new List<DonHangDTO>();

            List<DonHang> listDH = (List<DonHang>)data.sp_DonHangXem();
            foreach (DonHang dh in listDH)
            {
                DonHangDTO dhdto = new DonHangDTO(dh);
                listDHDTO.Add(dhdto);
            }

            return listDHDTO;
        }

        public static List<DonHangDTO> SelectDonHang_Username(string username)
        {
            List<DonHangDTO> listDHDTO = new List<DonHangDTO>();

            List<DonHang> listDH = (List<DonHang>)data.sp_DonHangXemUser(username);
            foreach (DonHang dh in listDH)
            {
                DonHangDTO dhdto = new DonHangDTO(dh);
                listDHDTO.Add(dhdto);
            }

            return listDHDTO;
        }

        public static int InsertDonHang(DonHangDTO dh)
        {
            int kq = 0;

            try {
                data.sp_ins_dh(dh.MADONHANG1, dh.TONGTIEN1, dh.NGAYMUA1, dh.TKUSERNAME1);
                data.SubmitChanges();
                kq = 1;
            }
            catch (Exception ex) { }

            return kq;
        }

        public static int DeleteDonHang_Ma(int madh)
        {
            int kq = 0;

            try
            {
                data.sp_del_DH_ma(madh);
                data.SubmitChanges();
                kq = 1;
            }
            catch (Exception ex) { }

            return kq;
        }

        public static int DeleteDonHang_TaiKhoan(string tk)
        {
            int kq = 0;

            try
            {
                data.sp_del_DH_tk(tk);
                data.SubmitChanges();
                kq = 1;
            }
            catch (Exception ex) { }

            return kq;
        }

        public static int UpdateDonHang(DonHangDTO dh)
        {
            int kq = 0;

            try
            {
                data.sp_update_dh(dh.MADONHANG1, dh.TONGTIEN1, dh.NGAYMUA1, dh.TKUSERNAME1);
                data.SubmitChanges();
                kq = 1;
            }
            catch (Exception ex) { }

            return kq;
        }

    }
}