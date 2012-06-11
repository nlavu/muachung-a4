using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PTUDW_TH2009_A4_GroupOn.DTO
{
    public class LoaiVoucherDTO
    {
        int MALOAIVOUCHER = 0;
        string TENLOAIVOUCHER = null;

        public string TENLOAIVOUCHER1
        {
            get { return TENLOAIVOUCHER; }
            set { TENLOAIVOUCHER = value; }
        }

        public LoaiVoucherDTO(LoaiVoucher v)
        {
            MALOAIVOUCHER = v.MALOAIVOUCHER;
            TENLOAIVOUCHER = v.TENLOAIVOUCHER;
        }

        public int MALOAIVOUCHER1
        {
            get { return MALOAIVOUCHER; }
            set { MALOAIVOUCHER = value; }
        }
    }
}