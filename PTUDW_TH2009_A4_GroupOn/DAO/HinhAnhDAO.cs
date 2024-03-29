﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PTUDW_TH2009_A4_GroupOn.DTO;

namespace PTUDW_TH2009_A4_GroupOn.DAO
{
    public class HinhAnhDAO
    {
        private static DataClasses1DataContext data = new DataClasses1DataContext();
        public  List<HinhAnhDTO> SelectAllHinhAnh()
        {
            List<HinhAnhDTO> listHADTO = new List<HinhAnhDTO>();

            List<HinhAnh> listHA = data.sp_HinhAnhXem().ToList();
            foreach (HinhAnh dh in listHA)
            {
                HinhAnhDTO dhdto = new HinhAnhDTO(dh);
                listHADTO.Add(dhdto);
            }

            return listHADTO;
        }

        public  int InsertHinhAnh(HinhAnhDTO ha)
        {
            int kq = 0;

            try {
                data.sp_ins_ha(ha.MAHINHANH1, ha.HINHDAIDIEN1, ha.HINHTHUMBNAIL1, ha.HINH11, ha.HINH21, ha.HINH31);
                data.SubmitChanges();
                kq = 1;
            }
            catch (Exception ex) { }

            return kq;
        }

        public int InsertHinhAnh_koma(HinhAnhDTO ha)
        {
            int kq = 0;

            try
            {
                data.sp_ins_ha_koma(ha.HINHDAIDIEN1, ha.HINHTHUMBNAIL1, ha.HINH11, ha.HINH21, ha.HINH31);
                data.SubmitChanges();
                kq = 1;
            }
            catch (Exception ex) { }

            return kq;
        }

        public  int DeleteHinhAnh(int maha)
        {
            int kq = 0;

            try
            {
                data.sp_del_hinh(maha);
                data.SubmitChanges();
                kq = 1;
            }
            catch (Exception ex) { }

            return kq;
        }

        public  int UpdateHinhAnh(HinhAnhDTO ha)
        {
            int kq = 0;

            try
            {
                data.sp_update_ha(ha.MAHINHANH1, ha.HINHDAIDIEN1, ha.HINHTHUMBNAIL1, ha.HINH11, ha.HINH21, ha.HINH31);
                data.SubmitChanges();
                kq = 1;
            }
            catch (Exception ex) { }

            return kq;
        }

        public static int laymahinhanhtheomavoucher(int mavoucher)
        {
            int mahinhanh = 0;
            try
            {
                mahinhanh = data.sp_LayMaHinhAnhTheoMaVoucher(mavoucher);
            }
            catch (Exception ex) { }
            return mahinhanh;
        }

        public static HinhAnhDTO layhinhanhtheomahinh(int mahinh)
        {
            HinhAnh item = data.sp_LayHinhAnhTheoMaHinh(mahinh).Single();
            HinhAnhDTO hinhanh = new HinhAnhDTO(item);

            return hinhanh;
        }
    }
}