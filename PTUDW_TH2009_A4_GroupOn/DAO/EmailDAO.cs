using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PTUDW_TH2009_A4_GroupOn.DTO;

namespace PTUDW_TH2009_A4_GroupOn.DAO
{
    public class EmailDAO
    {
        private static DataClasses1DataContext data = new DataClasses1DataContext();
        public  List<EmailDTO> SelectAllEmail()
        {
            List<EmailDTO> listEDTO = new List<EmailDTO>();

            List<Email> listE = (List<Email>)data.sp_EmailXem();
            foreach (Email e in listE)
            {
                EmailDTO dhdto = new EmailDTO(e);
                listEDTO.Add(dhdto);
            }

            return listEDTO;
        }

        public  int InsertEmail(EmailDTO e)
        {
            int kq = 0;
            try {
                data.sp_ins_mail(e.Email);
                data.SubmitChanges();
                kq = 1;
            }
            catch (Exception ex) { }
            return kq;
        }

        public  int DeleteEmail(string e)
        {
            int kq = 0;
            try
            {
                data.sp_del_mail(e);
                data.SubmitChanges();
                kq = 1;
            }
            catch (Exception ex) { }
            return kq;
        }

        public  int UpdateEmail(EmailDTO mailcu, EmailDTO mailmoi)
        {
            int kq = 0;

            try
            {
                data.sp_update_mail(mailcu.Email, mailmoi.Email);
                data.SubmitChanges();
                kq = 1;
            }
            catch (Exception ex) { }

            return kq;
        }

    }
}