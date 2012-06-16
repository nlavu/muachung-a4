using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PTUDW_TH2009_A4_GroupOn.DTO;

namespace PTUDW_TH2009_A4_GroupOn.DAO
{
    public class TaiKhoanDoanhNghiepDAO
    {
        private static DataClasses1DataContext data = new DataClasses1DataContext();
        public  List<TaiKhoanDoanhNghiepDTO> SelectAllTaiKhoanDoanhNghiep()
        {
            List<TaiKhoanDoanhNghiepDTO> listTKDTO = new List<TaiKhoanDoanhNghiepDTO>();

            List<TaiKhoanDoanhNghiep> listTK = data.sp_TaiKhoanDoanhNghiepXem().ToList();
            foreach (TaiKhoanDoanhNghiep dh in listTK)
            {
                TaiKhoanDoanhNghiepDTO dhdto = new TaiKhoanDoanhNghiepDTO(dh);
                listTKDTO.Add(dhdto);
            }

            return listTKDTO;
        }

        public  int InsertTaiKhoanDoanhNghiep(TaiKhoanDoanhNghiepDTO tk)
        {
            int kq = 0;

            try {
                data.sp_ins_tkdn(tk.MADN1, tk.TENDN1, tk.SDTDN1, tk.GIOITHIEU1, tk.WEBSITE1, tk.EMAIL1, tk.KINHDO1, tk.VIDO1, tk.MADIACHIDN1);
                data.SubmitChanges();
                kq = 1;
            }
            catch (Exception ex) { }

            return kq;
        }

        public  int UpdateTaiKhoanDoanhNghiep(TaiKhoanDoanhNghiepDTO tk)
        {
            int kq = 0;

            try
            {
                data.sp_update_tkdn(tk.MADN1, tk.TENDN1, tk.SDTDN1, tk.GIOITHIEU1, tk.WEBSITE1, tk.EMAIL1, tk.KINHDO1, tk.VIDO1, tk.MADIACHIDN1);
                data.SubmitChanges();
                kq = 1;
            }
            catch (Exception ex) { }

            return kq;
        }

        public int UpdateTaiKhoanDoanhNghiep_info(TaiKhoanDoanhNghiepDTO tk)
        {
            int kq = 0;

            try
            {
                data.sp_update_tkdn_koma(tk.MADN1, tk.TENDN1, tk.SDTDN1, tk.GIOITHIEU1, tk.WEBSITE1, tk.EMAIL1, tk.MADIACHIDN1);
                data.SubmitChanges();
                kq = 1;
            }
            catch (Exception ex) { }

            return kq;
        }

    }
}