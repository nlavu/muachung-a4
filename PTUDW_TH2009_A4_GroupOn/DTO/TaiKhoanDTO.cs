using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PTUDW_TH2009_A4_GroupOn.DTO
{
    public class TaiKhoanDTO
    {
        private string USERNAME = null;
        private string PASSWORD = null;
        private int MADN = 0;
        private int MAKH = 0;
        private int TKISAVAILABLE = 0;

        public TaiKhoanDTO(TAIKHOAN tk)
        {
            USERNAME = tk.USERNAME;
            PASSWORD = tk.PASSWORD;
            if(tk.MADN != null)
                MADN = (int)tk.MADN;
            if (tk.MAKH != null)
                MAKH = (int)tk.MAKH;
            TKISAVAILABLE = tk.TKISAVAILABLE;
        }

        public TaiKhoanDTO()
        {
            // TODO: Complete member initialization
        }

        public string USERNAME1
        {
            get { return USERNAME; }
            set { USERNAME = value; }
        }

        public string PASSWORD1
        {
            get { return PASSWORD; }
            set { PASSWORD = value; }
        }

        public int MADN1
        {
            get { return MADN; }
            set { MADN = value; }
        }

        public int MAKH1
        {
            get { return MAKH; }
            set { MAKH = value; }
        }

        public int TKISAVAILABLE1
        {
            get { return TKISAVAILABLE; }
            set { TKISAVAILABLE = value; }
        }
    }
}