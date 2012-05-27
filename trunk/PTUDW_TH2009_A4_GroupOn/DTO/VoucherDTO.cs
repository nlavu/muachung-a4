using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PTUDW_TH2009_A4_GroupOn.DTO
{
    public class VoucherDTO
    {
        private int MAVOUCHER = 0;
        private string TENVOUCHER = null;
        private DateTime THOIGIANBDKM = DateTime.Parse("1/1/1900");
        private DateTime THOIGIANKTKM = DateTime.Parse("1/1/1900");
        private string NOIDUNG = null;
        private int GIAGOC = 0;
        private int GIAKHUYENMAI = 0;
        private int SOLUONGTRONGKHO = 0;
        private int SOLUONGDAMUA = 0;
        private int THUOCTINHVIP = 0;
        private int TONGSOGIOBAN = 0;
        private int TRANGTHAIDUYET = 0;
        private int MAHINH = 0;
        private int MALOAIVOUCHER = 0;
        private int MAKHUVUC = 0;
        private int MADOANHNGHIEP = 0;
        private int ISAVAILABLE = 0;

        public VoucherDTO (Voucher vc)
        {
            this.MAVOUCHER1 = vc.MAVOUCHER;
            this.TENVOUCHER1 = vc.TENVOUCHER;
            this.THOIGIANBDKM1 = vc.THOIGIANBDKM;
            this.THOIGIANKTKM1 = vc.THOIGIANKTKM;
            this.NOIDUNG1 = vc.NOIDUNG;
            this.GIAGOC1 = vc.GIAGOC;
            this.GIAKHUYENMAI1 = vc.GIAKHUYENMAI;
            this.SOLUONGTRONGKHO1 = vc.SOLUONGTRONGKHO;
            this.SOLUONGDAMUA1 = vc.SOLUONGDAMUA;
            this.THUOCTINHVIP1 = vc.THUOCTINHVIP;
            this.TONGSOGIOBAN1 = vc.TONGSOGIOBAN;
            this.TRANGTHAIDUYET1 = vc.TRANGTHAIDUYET;
            this.MAHINH1 = vc.MAHINH;
            this.MALOAIVOUCHER1 = MALOAIVOUCHER;
            this.MAKHUVUC1 = vc.MAKHUVUC;
            this.MADOANHNGHIEP1 = vc.MADOANHNGHIEP;
            this.ISAVAILABLE1 = vc.ISAVAILABLE;
        }

        public int MALOAIVOUCHER1
        {
            get { return MALOAIVOUCHER; }
            set { MALOAIVOUCHER = value; }
        }

        public int MAHINH1
        {
            get { return MAHINH; }
            set { MAHINH = value; }
        }

        public int TRANGTHAIDUYET1
        {
            get { return TRANGTHAIDUYET; }
            set { TRANGTHAIDUYET = value; }
        }

        public int TONGSOGIOBAN1
        {
            get { return TONGSOGIOBAN; }
            set { TONGSOGIOBAN = value; }
        }

        public int THUOCTINHVIP1
        {
            get { return THUOCTINHVIP; }
            set { THUOCTINHVIP = value; }
        }

        public int SOLUONGDAMUA1
        {
            get { return SOLUONGDAMUA; }
            set { SOLUONGDAMUA = value; }
        }

        public int SOLUONGTRONGKHO1
        {
            get { return SOLUONGTRONGKHO; }
            set { SOLUONGTRONGKHO = value; }
        }

        public int GIAKHUYENMAI1
        {
            get { return GIAKHUYENMAI; }
            set { GIAKHUYENMAI = value; }
        }

        public int GIAGOC1
        {
            get { return GIAGOC; }
            set { GIAGOC = value; }
        }

        public string NOIDUNG1
        {
            get { return NOIDUNG; }
            set { NOIDUNG = value; }
        }

        public DateTime THOIGIANKTKM1
        {
            get { return THOIGIANKTKM; }
            set { THOIGIANKTKM = value; }
        }

        public DateTime THOIGIANBDKM1
        {
          get { return THOIGIANBDKM; }
          set { THOIGIANBDKM = value; }
        }

        public string TENVOUCHER1
        {
          get { return TENVOUCHER; }
          set { TENVOUCHER = value; }
        }

        public int MAVOUCHER1
        {
          get { return MAVOUCHER; }
          set { MAVOUCHER = value; }
        }   
  
        public int MAKHUVUC1
        {
          get { return MAKHUVUC; }
          set { MAKHUVUC = value; }
        }

        public int MADOANHNGHIEP1
        {
          get { return MADOANHNGHIEP; }
          set { MADOANHNGHIEP = value; }
        }

        public int ISAVAILABLE1
        {
          get { return ISAVAILABLE; }
          set { ISAVAILABLE = value; }
        }
    }
}