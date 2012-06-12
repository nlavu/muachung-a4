using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PTUDW_TH2009_A4_GroupOn.DTO
{
    public class TaiKhoanDoanhNghiepDTO
    {
        private int MADN = 0;
        private string TENDN = null;
        private string SDTDN = null;
        private string GIOITHIEU = null;
        private string WEBSITE = null;
        private string EMAIL = null;
        private string KINHDO = null;
        private string VIDO = null;
        private int MADIACHIDN = 0;

        public TaiKhoanDoanhNghiepDTO(TaiKhoanDoanhNghiep tk)
        {
            MADN = tk.MADN;
            TENDN = tk.TENDN;
            SDTDN = tk.SDTDN;
            GIOITHIEU = tk.GIOITHIEU;
            WEBSITE = tk.WEBSITE;
            EMAIL = tk.EMAIL;
            KINHDO = tk.KINHDO;
            VIDO = tk.VIDO;
            MADIACHIDN = tk.MADIACHIDN;
        }

        public TaiKhoanDoanhNghiepDTO()
        {
            // TODO: Complete member initialization
        }

        public int MADN1
        {
            get { return MADN; }
            set { MADN = value; }
        }

        public string TENDN1
        {
            get { return TENDN; }
            set { TENDN = value; }
        }

        public string SDTDN1
        {
            get { return SDTDN; }
            set { SDTDN = value; }
        }

        public string GIOITHIEU1
        {
            get { return GIOITHIEU; }
            set { GIOITHIEU = value; }
        }

        public string WEBSITE1
        {
            get { return WEBSITE; }
            set { WEBSITE = value; }
        }

        public string EMAIL1
        {
            get { return EMAIL; }
            set { EMAIL = value; }
        }

        public string KINHDO1
        {
            get { return KINHDO; }
            set { KINHDO = value; }
        }

        public string VIDO1
        {
            get { return VIDO; }
            set { VIDO = value; }
        }

        public int MADIACHIDN1
        {
            get { return MADIACHIDN; }
            set { MADIACHIDN = value; }
        }
    }
}