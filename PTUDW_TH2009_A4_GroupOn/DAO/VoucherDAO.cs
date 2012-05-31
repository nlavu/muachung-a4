using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PTUDW_TH2009_A4_GroupOn.DTO;

namespace PTUDW_TH2009_A4_GroupOn.DAO
{
    public class VoucherDAO
    {
        private static DataClasses1DataContext data = new DataClasses1DataContext();
        public  List<VoucherDTO> SelectAllVoucher()
        {
            List<VoucherDTO> lstVoucherDto = new List<VoucherDTO>();
            try
            {
                List<Voucher> listVoucher = (from d in data.Vouchers
                                                    select d).ToList();
                if (listVoucher != null)
                {
                    foreach (Voucher vc in listVoucher)
                    {
                        VoucherDTO voucherDto = new VoucherDTO(vc);
                        lstVoucherDto.Add(voucherDto);
                    }
                }

            }
            catch (Exception ex)
            {
            }
            return lstVoucherDto;
        }

        public  List<VoucherDTO> SelectVoucher_DoanhNghiep(int madn)
        {
            List<VoucherDTO> lstVoucherDto = new List<VoucherDTO>();
            List<Voucher> listV = (List<Voucher>)data.sp_VoucherXemDN(madn);
            foreach (Voucher v in listV)
            {
                VoucherDTO voucherDto = new VoucherDTO(v);
                lstVoucherDto.Add(voucherDto);
            }
            return lstVoucherDto;
        }

        public  List<VoucherDTO> SelectVoucher_KhuVuc(int kv)
        {
            List<VoucherDTO> lstVoucherDto = new List<VoucherDTO>();
            List<Voucher> listV = (List<Voucher>)data.sp_VoucherXemKhuVuc(kv);
            foreach (Voucher v in listV)
            {
                VoucherDTO voucherDto = new VoucherDTO(v);
                lstVoucherDto.Add(voucherDto);
            }
            return lstVoucherDto;
        }

        public  List<VoucherDTO> SelectVoucher_Loai(int loai)
        {
            List<VoucherDTO> lstVoucherDto = new List<VoucherDTO>();
            List<Voucher> listV = (List<Voucher>)data.sp_VoucherXemloai(loai);
            foreach (Voucher v in listV)
            {
                VoucherDTO voucherDto = new VoucherDTO(v);
                lstVoucherDto.Add(voucherDto);
            }
            return lstVoucherDto;
        }

        public  List<VoucherDTO> SelectVoucher_Loai(int loai, int khuvuc)
        {
            List<VoucherDTO> lstVoucherDto = new List<VoucherDTO>();
            List<Voucher> listV = (List<Voucher>)data.sp_VoucherXemloaiKV(loai, khuvuc);
            foreach (Voucher v in listV)
            {
                VoucherDTO voucherDto = new VoucherDTO(v);
                lstVoucherDto.Add(voucherDto);
            }
            return lstVoucherDto;
        }

        public int InsertVoucher(VoucherDTO v)
        {
            int kq = 0;

            try {
                data.sp_ins_voucher(v.MAVOUCHER1, v.TENVOUCHER1, v.THOIGIANBDKM1, v.THOIGIANKTKM1, v.NOIDUNG1, v.GIAGOC1, v.GIAKHUYENMAI1, v.SOLUONGTRONGKHO1, v.SOLUONGDAMUA1, v.THUOCTINHVIP1, v.TONGSOGIOBAN1, v.TRANGTHAIDUYET1, v.MAHINH1, v.MALOAIVOUCHER1, v.MAKHUVUC1, v.MADOANHNGHIEP1, v.ISAVAILABLE1);
                data.SubmitChanges();
                kq = 1;
            }
            catch (Exception ex) { }

            return kq;
        }

        public  int DeleteVoucher_DoanhNghiep(int madn)
        {
            int kq = 0;

            try
            {
                data.sp_del_voucher_dn(madn);
                data.SubmitChanges();
                kq = 1;
            }
            catch (Exception ex) { }

            return kq;
        }

        public  int DeleteVoucher_KhuVuc(int makv)
        {
            int kq = 0;

            try
            {
                data.sp_del_voucher_kv(makv);
                data.SubmitChanges();
                kq = 1;
            }
            catch (Exception ex) { }

            return kq;
        }

        public  int DeleteVoucher_Loai(int loai)
        {
            int kq = 0;

            try
            {
                data.sp_del_voucher_loai(loai);
                data.SubmitChanges();
                kq = 1;
            }
            catch (Exception ex) { }

            return kq;
        }

        public  int DeleteVoucher_MaVoucher(int ma)
        {
            int kq = 0;

            try
            {
                data.sp_del_voucher_ma(ma);
                data.SubmitChanges();
                kq = 1;
            }
            catch (Exception ex) { }

            return kq;
        }

        public  int DeleteVoucher_NgayKetThuc(DateTime ngay)
        {
            int kq = 0;

            try
            {
                data.sp_del_voucher_ngaykt(ngay);
                data.SubmitChanges();
                kq = 1;
            }
            catch (Exception ex) { }

            return kq;
        }

        public  int UpdateVoucher(VoucherDTO v)
        {
            int kq = 0;

            try
            {
                data.sp_update_voucher(v.MAVOUCHER1, v.TENVOUCHER1, v.THOIGIANBDKM1, v.THOIGIANKTKM1, v.NOIDUNG1, v.GIAGOC1, v.GIAKHUYENMAI1, v.SOLUONGTRONGKHO1, v.SOLUONGDAMUA1, v.THUOCTINHVIP1, v.TONGSOGIOBAN1, v.TRANGTHAIDUYET1, v.MAHINH1, v.MALOAIVOUCHER1, v.MAKHUVUC1, v.MADOANHNGHIEP1, v.ISAVAILABLE1);
                data.SubmitChanges();
                kq = 1;
            }
            catch (Exception ex) { }

            return kq;
        }

    }
}