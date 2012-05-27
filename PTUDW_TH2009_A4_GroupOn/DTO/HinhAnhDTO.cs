using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PTUDW_TH2009_A4_GroupOn.DTO
{
    public class HinhAnhDTO
    {
        private int MAHINHANH = 0;
        private string HINHDAIDIEN = null;
        private string HINHTHUMBNAIL = null;
        private string HINH1 = null;
        private string HINH2 = null;
        private string HINH3 = null;

        public HinhAnhDTO(HinhAnh ha)
        {
            MAHINHANH = ha.MAHINHANH;
            HINHDAIDIEN = ha.HINHDAIDIEN;
            HINHTHUMBNAIL = ha.HINHTHUMBNAIL;
            HINH1 = ha.HINH1;
            HINH2 = ha.HINH2;
            HINH3 = ha.HINH3;
        }

        public string HINH31
        {
            get { return HINH3; }
            set { HINH3 = value; }
        }


        public int MAHINHANH1
        {
            get { return MAHINHANH; }
            set { MAHINHANH = value; }
        }


        public string HINHDAIDIEN1
        {
            get { return HINHDAIDIEN; }
            set { HINHDAIDIEN = value; }
        }


        public string HINHTHUMBNAIL1
        {
            get { return HINHTHUMBNAIL; }
            set { HINHTHUMBNAIL = value; }
        }


        public string HINH11
        {
            get { return HINH1; }
            set { HINH1 = value; }
        }

        public string HINH21
        {
            get { return HINH2; }
            set { HINH2 = value; }
        }


    }
}