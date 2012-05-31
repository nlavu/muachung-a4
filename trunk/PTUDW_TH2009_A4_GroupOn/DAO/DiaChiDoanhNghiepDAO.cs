using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PTUDW_TH2009_A4_GroupOn.DTO;

namespace PTUDW_TH2009_A4_GroupOn.DAO
{
    public class DiaChiDoanhNghiepDAO
    {
        private static DataClasses1DataContext data = new DataClasses1DataContext();
        public  List<DiaChiDoanhNghiepDTO> SelectAllDCDoanhNghiep()
        {
            List<DiaChiDoanhNghiepDTO> listDNDTO = new List<DiaChiDoanhNghiepDTO>();

            List<DiaChiDoanhNghiep> listDN = (List<DiaChiDoanhNghiep>)data.sp_DiaChiDoanhNghiepXem();
            foreach (DiaChiDoanhNghiep dc in listDN)
            {
                DiaChiDoanhNghiepDTO dndto = new DiaChiDoanhNghiepDTO(dc);
                listDNDTO.Add(dndto);
            }

            return listDNDTO;
        }

        public  int InsertDiaChiDoanhNghiep(DiaChiDoanhNghiepDTO dc)
        {
            int kq = 0;

            try {
                data.sp_ins_dcdn(dc.MADC1, dc.DC11, dc.DC21, dc.DC31);
                data.SubmitChanges();
                kq = 1;
            }
            catch (Exception ex) { }

            return kq;
        }

        public  int UpdateDiaChiDoanhNghiep(DiaChiDoanhNghiepDTO dc)
        {
            int kq = 0;

            try
            {
                data.sp_update_dcdn(dc.MADC1, dc.DC11, dc.DC21, dc.DC31);
                data.SubmitChanges();
                kq = 1;
            }
            catch (Exception ex) { }

            return kq;
        }

    }
}