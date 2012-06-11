using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using PTUDW_TH2009_A4_GroupOn.DTO;

namespace PTUDW_TH2009_A4_GroupOn.DAO
{
    public class ChiTietDonHangDAO
    {
        private static DataClasses1DataContext data = new DataClasses1DataContext();
        /*public static List<ChiTietDonHangDTO> SelectAllChiTietDonHang()
        {
            List<ChiTietDonHangDTO> lstChiTietonHangDto = new List<ChiTietDonHangDTO>();
            try
            {
                List<ChiTietDonHang> listDonHang = (from d in data.ChiTietDonHangs
                                                    select d).ToList();
                foreach (ChiTietDonHang ctdh in listDonHang)
                {
                    ChiTietDonHangDTO chitietdonhangDto = new ChiTietDonHangDTO();
                    lstChiTietonHangDto.Add(chitietdonhangDto);
                }

            }
            catch (Exception ex)
            {
            }
            return lstChiTietonHangDto;
        }*/

        public  List<ChiTietDonHangDTO> SelectAllChiTietDonHang()
        {
            List<ChiTietDonHangDTO> lstChiTietonHangDto = new List<ChiTietDonHangDTO>();
            List<ChiTietDonHang> listCTDH = data.sp_ChiTietDonHangXem().ToList();
            foreach (ChiTietDonHang ctdh in listCTDH)
            {
                ChiTietDonHangDTO chitietdonhangDto = new ChiTietDonHangDTO(ctdh);
                lstChiTietonHangDto.Add(chitietdonhangDto);
            }
            return lstChiTietonHangDto;
        }

        public  List<ChiTietDonHangDTO> SelectChiTietDonHang_MaDH(int madh)
        {
            List<ChiTietDonHangDTO> lstChiTietonHangDto = new List<ChiTietDonHangDTO>();
            List<ChiTietDonHang> listCTDH = data.sp_ChiTietDonHangXemMDH(madh).ToList();
            foreach (ChiTietDonHang ctdh in listCTDH)
            {
                ChiTietDonHangDTO chitietdonhangDto = new ChiTietDonHangDTO(ctdh);
                lstChiTietonHangDto.Add(chitietdonhangDto);
            }
            return lstChiTietonHangDto;
        }

        public  int InsertChiTietDonHang(ChiTietDonHangDTO ctdh)
        {
            int kq = 0;

            try
            {
                data.sp_ins_ctdh(ctdh.SOLUONGMUA1, ctdh.TRANGTHAIGIAOHANG1, ctdh.TRANGTHAISUDUNG1, ctdh.LANGIAOHANGTHU1, ctdh.NGAYGIAOHANG1, ctdh.MADH1, ctdh.VOUCHERDH1);
                data.SubmitChanges();
                kq = 1;
            }
            catch (Exception ex)
            {
            }
            return kq;
        }

        public  int DeleteChiTietDonHang_MaCT(int ctdh)
        {
            int kq = 0;

            try
            {
                data.sp_del_CTDH_ma(ctdh);
                data.SubmitChanges();
                kq = 1;
            }
            catch (Exception ex)
            {
            }
            return kq;
        }

        public  int DeleteChiTietDonHang_MaVoucher(int voucher)
        {
            int kq = 0;

            try
            {
                data.sp_del_CTDH_voucher(voucher);
                data.SubmitChanges();
                kq = 1;
            }
            catch (Exception ex)
            {
            }
            return kq;
        }

        public  int UpdateCTDH(ChiTietDonHangDTO ctdh)
        {
            int kq = 0;

            try
            {
                data.sp_update_ctdh(ctdh.SOLUONGMUA1, ctdh.TRANGTHAIGIAOHANG1, ctdh.TRANGTHAISUDUNG1, ctdh.LANGIAOHANGTHU1, ctdh.NGAYGIAOHANG1, ctdh.MADH1, ctdh.VOUCHERDH1);
                data.SubmitChanges();
                kq = 1;
            }
            catch (Exception ex) { }

            return kq;
        }
    }
}