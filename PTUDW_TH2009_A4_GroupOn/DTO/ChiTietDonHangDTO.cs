using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PTUDW_TH2009_A4_GroupOn.DTO
{
    public class ChiTietDonHangDTO
    {
        private int SOLUONGMUA = 0;
        private string TRANGTHAIGIAOHANG = null;
        private string TRANGTHAISUDUNG = null;
        private int LANGIAOHANGTHU = 0;
        private DateTime NGAYGIAOHANG = DateTime.Parse("1/1/1900");
        private int MADH = 0;
        private int VOUCHERDH = 0;

        public ChiTietDonHangDTO(ChiTietDonHang ct)
        {
            SOLUONGMUA = ct.SOLUONGMUA;
            TRANGTHAIGIAOHANG = ct.TRANGTHAIGIAOHANG;
            TRANGTHAISUDUNG = ct.TRANGTHAISUDUNG;
            LANGIAOHANGTHU = ct.LANGIAOHANGTHU;
            NGAYGIAOHANG = ct.NGAYGIAOHANG;
            MADH = ct.MADH;
            VOUCHERDH = ct.VOUCHERDH;
        }

        public int SOLUONGMUA1
        {
            get { return SOLUONGMUA; }
            set { SOLUONGMUA = value; }
        }        

        public string TRANGTHAIGIAOHANG1
        {
            get { return TRANGTHAIGIAOHANG; }
            set { TRANGTHAIGIAOHANG = value; }
        }
        
        public string TRANGTHAISUDUNG1
        {
            get { return TRANGTHAISUDUNG; }
            set { TRANGTHAISUDUNG = value; }
        }

        public int LANGIAOHANGTHU1
        {
            get { return LANGIAOHANGTHU; }
            set { LANGIAOHANGTHU = value; }
        }

        public DateTime NGAYGIAOHANG1
        {
            get { return NGAYGIAOHANG; }
            set { NGAYGIAOHANG = value; }
        }

        public int MADH1
        {
            get { return MADH; }
            set { MADH = value; }
        }

        public int VOUCHERDH1
        {
            get { return VOUCHERDH; }
            set { VOUCHERDH = value; }
        }
    }
}