using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PTUDW_TH2009_A4_GroupOn.DTO
{
    public class DonHangDTO
    {
        private int MADONHANG = 0;
        private int TONGTIEN = 0;
        private DateTime NGAYMUA = DateTime.Parse("1/1/1900");
        private string TKUSERNAME = null;

        public DonHangDTO(DonHang dh)
        {
            MADONHANG = dh.MADONHANG;
            TONGTIEN = dh.TONGTIEN;
            NGAYMUA = dh.NGAYMUA;
            TKUSERNAME = dh.TKUSERNAME;
        }

        public string TKUSERNAME1
        {
            get { return TKUSERNAME; }
            set { TKUSERNAME = value; }
        }

        public int MADONHANG1
        {
            get { return MADONHANG; }
            set { MADONHANG = value; }
        }
        
        public int TONGTIEN1
        {
            get { return TONGTIEN; }
            set { TONGTIEN = value; }
        }

        public DateTime NGAYMUA1
        {
            get { return NGAYMUA; }
            set { NGAYMUA = value; }
        }
    }
}