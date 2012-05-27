using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PTUDW_TH2009_A4_GroupOn.DTO
{
    public class KhuVucDTO
    {
        int MAKHUVUC = 0;
        string TENKHUVUC = null;

        public KhuVucDTO(KhuVuc kv)
        {
            MAKHUVUC = kv.MAKHUVUC;
            TENKHUVUC = kv.TENKHUVUC;
        }

        public string TENKHUVUC1
        {
            get { return TENKHUVUC; }
            set { TENKHUVUC = value; }
        }

        public int MAKHUVUC1
        {
          get { return MAKHUVUC; }
          set { MAKHUVUC = value; }
        }
    }
}