﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PTUDW_TH2009_A4_GroupOn.DTO;

namespace PTUDW_TH2009_A4_GroupOn.DAO
{
    public class CommentDAO
    {
        private static DataClasses1DataContext data = new DataClasses1DataContext();

        public static List<CommentDTO> SelectAllComment()
        {
            List<CommentDTO> listComment = new List<CommentDTO>();

            List<Comment> listcm = (List<Comment>)data.sp_CommentXem();
            foreach (Comment cm in listcm)
            {
                CommentDTO cmDto = new CommentDTO(cm);
                listComment.Add(cmDto);
            }

            return listComment;
        }

        public static List<CommentDTO> SelectComment_Voucher(int v)
        {
            List<CommentDTO> listComment = new List<CommentDTO>();

            List<Comment> listcm = (List<Comment>)data.sp_CommentXemVoucher(v);
            foreach (Comment cm in listcm)
            {
                CommentDTO cmDto = new CommentDTO(cm);
                listComment.Add(cmDto);
            }

            return listComment;
        }

        public static int InsertComment(CommentDTO cm)
        {
            int kq = 0;

            try
            {
                data.sp_ins_com(cm.NOIDUNG1, cm.THOIGIAN1, cm.TKCOMMENT1, cm.MAVOUCHERCOMMENT1);
                data.SubmitChanges();
                kq = 1;
            }
            catch (Exception ex) { }

            return kq;
        }

        public static int DeleteComment_MaVoucher(int mavoucher)
        {
            int kq = 0;

            try
            {
                data.sp_del_com_ma(mavoucher);
                data.SubmitChanges();
                kq = 1;
            }
            catch (Exception ex) { }

            return kq;
        }

        public static int DeleteComment_TaiKhoan(string tk)
        {
            int kq = 0;

            try
            {
                data.sp_del_com_tk(tk);
                data.SubmitChanges();
                kq = 1;
            }
            catch (Exception ex) { }

            return kq;
        }

        public static int DeleteComment_TaiKhoan_MaVoucher(string tk, int ma)
        {
            int kq = 0;

            try
            {
                data.sp_del_com_tk_ma(tk, ma);
                data.SubmitChanges();
                kq = 1;
            }
            catch (Exception ex) { }

            return kq;
        }

        public static int UpdateComment(CommentDTO cm)
        {
            int kq = 0;

            try
            {
                data.sp_update_com(cm.NOIDUNG1, cm.THOIGIAN1, cm.TKCOMMENT1, cm.MAVOUCHERCOMMENT1);
                data.SubmitChanges();
                kq = 1;
            }
            catch (Exception ex) { }

            return kq;
        }
    }
}