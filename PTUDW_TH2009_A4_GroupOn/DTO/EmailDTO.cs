using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PTUDW_TH2009_A4_GroupOn.DTO
{
    public class EmailDTO
    {
        private string email = null;

        public string Email
        {
            get { return email; }
            set { email = value; }
        }

        public EmailDTO(Email e)
        {
            email = e.EMAIL1;
        }

    }
}