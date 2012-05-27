using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PTUDW_TH2009_A4_GroupOn.DTO;

namespace PTUDW_TH2009_A4_GroupOn.DAO
{
    public class TaiKhoanDAO
    {
        private static DataClasses1DataContext data = new DataClasses1DataContext();
        public static List<TaiKhoanDTO> SelectAllTaiKhoan()
        {
            List<TaiKhoanDTO> listTKDTO = new List<TaiKhoanDTO>();

            List<TAIKHOAN> listTK = (List<TAIKHOAN>)data.sp_TaiKhoanXem();
            foreach (TAIKHOAN dh in listTK)
            {
                TaiKhoanDTO dhdto = new TaiKhoanDTO(dh);
                listTKDTO.Add(dhdto);
            }

            return listTKDTO;
        }

        public static List<TaiKhoanDTO> SelectTaiKhoan_Username(string user)
        {
            List<TaiKhoanDTO> listTKDTO = new List<TaiKhoanDTO>();

            List<TAIKHOAN> listTK = (List<TAIKHOAN>)data.sp_TaiKhoanXemUser(user);
            foreach (TAIKHOAN dh in listTK)
            {
                TaiKhoanDTO dhdto = new TaiKhoanDTO(dh);
                listTKDTO.Add(dhdto);
            }

            return listTKDTO;
        }

        public static int InsertTaiKhoan(TaiKhoanDTO tk)
        {
            int kq = 0;

            try {
                data.sp_ins_tk(tk.USERNAME1, tk.PASSWORD1, tk.MADN1, tk.MAKH1, tk.TKISAVAILABLE1);
                data.SubmitChanges();
                kq = 1;
            }
            catch (Exception ex) { }

            return kq;
        }

        public static int DeleteTaiKhoan(string tk)
        {
            int kq = 0;

            try
            {
                data.sp_del_taikhoan(tk);
                data.SubmitChanges();
                kq = 1;
            }
            catch (Exception ex) { }

            return kq;
        }

        public static int UpdateTaiKhoan(TaiKhoanDTO tk)
        {
            int kq = 0;

            try
            {
                data.sp_update_tk(tk.USERNAME1, tk.PASSWORD1, tk.MADN1, tk.MAKH1, tk.TKISAVAILABLE1);
                data.SubmitChanges();
                kq = 1;
            }
            catch (Exception ex) { }

            return kq;
        }

    }
}