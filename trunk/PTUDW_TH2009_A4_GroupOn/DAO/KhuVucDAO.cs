using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PTUDW_TH2009_A4_GroupOn.DTO;

namespace PTUDW_TH2009_A4_GroupOn.DAO
{
    public class KhuVucDAO
    {
        private static DataClasses1DataContext data = new DataClasses1DataContext();
        public  List<KhuVucDTO> SelectAllKhuVuc()
        {
            List<KhuVucDTO> listKVDTO = new List<KhuVucDTO>();

            List<KhuVuc> listKV = (List<KhuVuc>)data.sp_KhuVucXem();
            foreach (KhuVuc dh in listKV)
            {
                KhuVucDTO dhdto = new KhuVucDTO(dh);
                listKVDTO.Add(dhdto);
            }

            return listKVDTO;
        }

        public  int InsertKhuVuc(KhuVucDTO kv)
        {
            int kq = 0;

            try {
                data.sp_ins_kv(kv.MAKHUVUC1, kv.TENKHUVUC1);
                data.SubmitChanges();
                kq = 1;
            }
            catch(Exception ex){}

            return kq;
        }

        public  int DeleteKhuVuc(int makv)
        {
            int kq = 0;

            try
            {
                data.sp_del_khuvuc(makv);
                data.SubmitChanges();
                kq = 1;
            }
            catch (Exception ex) { }

            return kq;
        }

        public  int UpdateKhuVuc(KhuVucDTO kv)
        {
            int kq = 0;

            try
            {
                data.sp_update_kv(kv.MAKHUVUC1, kv.TENKHUVUC1);
                data.SubmitChanges();
                kq = 1;
            }
            catch (Exception ex) { }

            return kq;
        }

    }
}