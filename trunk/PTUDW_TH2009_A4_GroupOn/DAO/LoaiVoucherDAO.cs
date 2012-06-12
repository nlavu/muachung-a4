﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PTUDW_TH2009_A4_GroupOn.DTO;

namespace PTUDW_TH2009_A4_GroupOn.DAO
{
    public class LoaiVoucherDAO
    {
        private static DataClasses1DataContext data = new DataClasses1DataContext();
        public  List<LoaiVoucherDTO> SelectAllLoaiVoucher()
        {
            List<LoaiVoucherDTO> listLKVDTO = new List<LoaiVoucherDTO>();

            List<LoaiVoucher> listLKV = data.sp_LoaiVoucherXem().ToList();
            foreach (LoaiVoucher dh in listLKV)
            {
                LoaiVoucherDTO dhdto = new LoaiVoucherDTO(dh);
                listLKVDTO.Add(dhdto);
            }

            return listLKVDTO;
        }

        public  int InsertLoaiVoucher(LoaiVoucherDTO vc)
        {
            int kq = 0;

            try {
                data.sp_ins_loaivoucher(vc.MALOAIVOUCHER1, vc.TENLOAIVOUCHER1);
                data.SubmitChanges();
                kq = 1;
            }
            catch (Exception ex) { }

            return kq;
        }

        public  int InsertLoaiVoucher(int vc)
        {
            int kq = 0;

            try
            {
                data.sp_del_loaivoucher(vc);
                data.SubmitChanges();
                kq = 1;
            }
            catch (Exception ex) { }

            return kq;
        }

        public  int UpdateLoaiVoucher(LoaiVoucherDTO vc)
        {
            int kq = 0;

            try
            {
                data.sp_update_loaivoucher(vc.MALOAIVOUCHER1, vc.TENLOAIVOUCHER1);
                data.SubmitChanges();
                kq = 1;
            }
            catch (Exception ex) { }

            return kq;
        }

    }
}