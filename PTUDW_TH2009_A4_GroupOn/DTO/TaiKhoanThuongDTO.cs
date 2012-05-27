using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PTUDW_TH2009_A4_GroupOn.DTO
{
    public class TaiKhoanThuongDTO
    {
        private int MAKH = 0;
        private string DIACHI = null;
        private string EMAIL = null;
        private string SDT = null;

        public TaiKhoanThuongDTO(TaiKhoanThuong tk)
        {
            MAKH = tk.MAKH;
            DIACHI = tk.DIACHI;
            EMAIL = tk.EMAIL;
            SDT = tk.SDT;
        }

        public int MAKH1
        {
            get { return MAKH; }
            set { MAKH = value; }
        }

        public string DIACHI1
        {
            get { return DIACHI; }
            set { DIACHI = value; }
        }

        public string EMAIL1
        {
            get { return EMAIL; }
            set { EMAIL = value; }
        }

        public string SDT1
        {
            get { return SDT; }
            set { SDT = value; }
        }
    }
}