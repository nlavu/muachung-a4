using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PTUDW_TH2009_A4_GroupOn.DTO;
using PTUDW_TH2009_A4_GroupOn.DAO;

namespace PTUDW_TH2009_A4_GroupOn.BUS
{
    public class HinhAnhBUS
    {
        public static int laymahinhanhtheomavoucher(int mavoucher)
        {
            return HinhAnhDAO.laymahinhanhtheomavoucher(mavoucher);
        }

        public static HinhAnhDTO layhinhanhtheomahinh(int mahinh)
        {
            return HinhAnhDAO.layhinhanhtheomahinh(mahinh);
        }
    }
}