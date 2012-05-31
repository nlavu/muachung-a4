using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PTUDW_TH2009_A4_GroupOn.DTO;

namespace PTUDW_TH2009_A4_GroupOn.DAO
{
    public class TaiKhoanThuongDAO
    {
        private static DataClasses1DataContext data = new DataClasses1DataContext();
        public  List<TaiKhoanThuongDTO> SelectAllTaiKhoanThuong()
        {
            List<TaiKhoanThuongDTO> listTKDTO = new List<TaiKhoanThuongDTO>();

            List<TaiKhoanThuong> listTKT = (List<TaiKhoanThuong>)data.sp_TaiKhoanThuongXem();
            foreach (TaiKhoanThuong dh in listTKT)
            {
                TaiKhoanThuongDTO dhdto = new TaiKhoanThuongDTO(dh);
                listTKDTO.Add(dhdto);
            }

            return listTKDTO;
        }

        public  int InsertTaiKhoanThuong(TaiKhoanThuongDTO tk)
        {
            int kq = 0;

            try {
                data.sp_ins_taikhoanthuong(tk.MAKH1, tk.DIACHI1, tk.EMAIL1, tk.SDT1);
                data.SubmitChanges();
                kq = 1;
            }
            catch (Exception ex) { }
            
            return kq;
        }

        public  int UpdateTaiKhoanThuong(TaiKhoanThuongDTO tk)
        {
            int kq = 0;

            try
            {
                data.sp_update_taikhoanthuong(tk.MAKH1, tk.DIACHI1, tk.EMAIL1, tk.SDT1);
                data.SubmitChanges();
                kq = 1;
            }
            catch (Exception ex) { }

            return kq;
        }

    }
}