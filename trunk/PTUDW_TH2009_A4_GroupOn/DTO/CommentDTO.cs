using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PTUDW_TH2009_A4_GroupOn.DTO
{
    public class CommentDTO
    {
        private string NOIDUNG = null;
        private DateTime THOIGIAN = DateTime.Parse("1/1/1900");
        private string TKCOMMENT = null;
        private int MAVOUCHERCOMMENT = 0;

        public CommentDTO(Comment cm)
        {
            NOIDUNG = cm.NOIDUNG;
            THOIGIAN = cm.THOIGIAN;
            TKCOMMENT = cm.TKCOMMENT;
            MAVOUCHERCOMMENT = cm.MAVOUCHERCOMMENT;
        }

        public string NOIDUNG1
        {
            get { return NOIDUNG; }
            set { NOIDUNG = value; }
        }

        public DateTime THOIGIAN1
        {
            get { return THOIGIAN; }
            set { THOIGIAN = value; }
        }
        
        public string TKCOMMENT1
        {
            get { return TKCOMMENT; }
            set { TKCOMMENT = value; }
        }        

        public int MAVOUCHERCOMMENT1
        {
            get { return MAVOUCHERCOMMENT; }
            set { MAVOUCHERCOMMENT = value; }
        }
    }
}