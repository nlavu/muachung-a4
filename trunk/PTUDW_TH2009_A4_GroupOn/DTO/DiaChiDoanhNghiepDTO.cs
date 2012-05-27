using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PTUDW_TH2009_A4_GroupOn.DTO
{
    public class DiaChiDoanhNghiepDTO
    {
        private int MADC = 0;
        private string DC1 = null;
        private string DC2 = null;
        private string DC3 = null;

        public DiaChiDoanhNghiepDTO(DiaChiDoanhNghiep dc)
        {
            MADC = dc.MADC;
            DC1 = dc.DC1;
            DC2 = dc.DC2;
            DC3 = dc.DC3;
        }

        public int MADC1
        {
            get { return MADC; }
            set { MADC = value; }
        }

        public string DC11
        {
            get { return DC1; }
            set { DC1 = value; }
        }

        public string DC21
        {
            get { return DC2; }
            set { DC2 = value; }
        }

        public string DC31
        {
            get { return DC3; }
            set { DC3 = value; }
        }
        
    }
}