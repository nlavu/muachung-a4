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
        public static VoucherDTO SelectVoucher_MaVoucher(int mavoucher)
        {
            List<VoucherDTO> lstVoucherDto = new List<VoucherDTO>();
            List<Voucher> listV = data.sp_VoucherXemMaVoucher(mavoucher).ToList();
            foreach (Voucher v in listV)
            {
                VoucherDTO voucherDto = new VoucherDTO(v);
                lstVoucherDto.Add(voucherDto);
            }
            return lstVoucherDto[0];
        }

        public static List<VoucherDTO> SelectTop6TheoMaLoai(int maloai)
        {
            List<VoucherDTO> lstTop6VoucherDto = new List<VoucherDTO>();
            List<Voucher> list = data.sp_Top6VoucherTheoMaLoai(maloai).ToList();
            foreach (Voucher vc in list)
            {
                VoucherDTO voucherDto = new VoucherDTO(vc);
                lstTop6VoucherDto.Add(voucherDto);
            }
            return lstTop6VoucherDto;
        }

        public static  List<VoucherDTO> SelectAllVoucher()
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

        public static List<VoucherDTO> SelectVoucher_DoanhNghiep(int madn)
        {
            List<VoucherDTO> lstVoucherDto = new List<VoucherDTO>();
            List<Voucher> listV = data.sp_VoucherXemDN(madn).ToList();
            foreach (Voucher v in listV)
            {
                VoucherDTO voucherDto = new VoucherDTO(v);
                lstVoucherDto.Add(voucherDto);
            }
            return lstVoucherDto;
        }

        public static List<VoucherDTO> SelectVoucher_KhuVuc(int kv)
        {
            List<VoucherDTO> lstVoucherDto = new List<VoucherDTO>();
            List<Voucher> listV = data.sp_VoucherXemKhuVuc(kv).ToList();
            foreach (Voucher v in listV)
            {
                VoucherDTO voucherDto = new VoucherDTO(v);
                lstVoucherDto.Add(voucherDto);
            }
            return lstVoucherDto;
        }

        public static List<VoucherDTO> SelectVoucher_Loai(int loai)
        {
            List<VoucherDTO> lstVoucherDto = new List<VoucherDTO>();
            List<Voucher> listV = data.sp_VoucherXemloai(loai).ToList();
            foreach (Voucher v in listV)
            {
                VoucherDTO voucherDto = new VoucherDTO(v);
                lstVoucherDto.Add(voucherDto);
            }
            return lstVoucherDto;
        }

        public static List<VoucherDTO> SelectVoucher_Loai_KhuVuc(int loai, int khuvuc)
        {
            List<VoucherDTO> lstVoucherDto = new List<VoucherDTO>();
            List<Voucher> listV = data.sp_VoucherXemloaiKV(loai, khuvuc).ToList();
            foreach (Voucher v in listV)
            {
                VoucherDTO voucherDto = new VoucherDTO(v);
                lstVoucherDto.Add(voucherDto);
            }
            return lstVoucherDto;
        }

        public static int InsertVoucher(VoucherDTO v)
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

        public static int DeleteVoucher_DoanhNghiep(int madn)
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

        public static int DeleteVoucher_KhuVuc(int makv)
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

        public static int DeleteVoucher_Loai(int loai)
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

        public static int DeleteVoucher_MaVoucher(int ma)
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

        public static int DeleteVoucher_NgayKetThuc(DateTime ngay)
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

        public static  int UpdateVoucher(VoucherDTO v)
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

        public static void TinhSoLuongDaMua(int madh)
        {
            //ChiTietDonHangDTO ctdh = new ChiTietDonHangDTO();
            //ctdh = (ChiTietDonHangDTO)data.sp_ChiTietDonHangXemMDH(madh);
            //int soluongmua = ctdh.SOLUONGMUA1;
            //VoucherDTO voucher = (VoucherDTO)data.sp_VoucherXemMaVoucher(madh);
            //int soluongkho = voucher.SOLUONGTRONGKHO1;
            //int conlai = 0;
            //conlai = soluongkho - soluongmua;
            ChiTietDonHangDTO ctdh = (ChiTietDonHangDTO)data.sp_ChiTietDonHangXemMDH(madh);
            int soluongmua = Int32.Parse(data.sp_count_soluongdamua(madh).ToString());
            data.sp_update_vouchersoluong(soluongmua, ctdh.VOUCHERDH1);
        }

    }
}