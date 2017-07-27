<%@ WebHandler Language="C#" Class="ProcessSendToCalendar" %>

using System;
using System.Web;
using System.Web.SessionState;
using System.Linq;
public class ProcessSendToCalendar : IHttpHandler,IRequiresSessionState {
    FactoryDBDataContext db = new FactoryDBDataContext();
    public void ProcessRequest (HttpContext context) {
        string date = "";
        string newname="", storename="";
        for(int i = 0; i <= 3; i++)
        {
            if (context.Request["picker" + i] != null)
            {
                var table = from s in db.tMember
                            where s.fIdMember == (context.Session[CDKey.LOGINUSER] as tMember).fIdMember || s.fIdMember == (context.Session[CDKey.ServiceChoose] as tServices[])[i].fIdStores
                            select new { name=s.fName,iden=s.fIdentity};
                if (table.Count() > 0)
                {
                    foreach(var n in table)
                    {
                        if (0 == n.iden){
                            newname = n.name;
                        } else
                        {
                            storename = n.name;
                        }
                    }
                }
                date = context.Request["picker" + i];
                tCalendar x = new tCalendar();
                x.fDate = Convert.ToDateTime(date);
                x.fIdMember = (context.Session[CDKey.LOGINUSER] as tMember).fIdMember;
                x.fIdServices = (context.Session[CDKey.ServiceChoose] as tServices[])[i].fIdServices;
                x.fIdStores = (context.Session[CDKey.ServiceChoose] as tServices[])[i].fIdStores;
                x.fAccepted = false;
                db.tCalendar.InsertOnSubmit(x);
                //db.SubmitChanges();
                /*tAvailableTime a = new tAvailableTime();
                a.fAvailableTime = Convert.ToDateTime(date);
                a.fIdStores = (context.Session[CDKey.ServiceChoose] as tServices[])[i].fIdStores;
                db.tAvailableTime.InsertOnSubmit(a);*/
                //db.SubmitChanges();
                tLetter l = new tLetter();
                l.fIdReceiver = (context.Session[CDKey.LOGINUSER] as tMember).fIdMember;
                l.fContent = (context.Session[CDKey.ServiceChoose] as tServices[])[i].fName+" 服務方案請求已寄送給 " + storename + " 廠商，待其接受確認後便會加入專屬行事曆，您可前往專屬行事曆查看所有已接受及等待接受之服務";
                l.fIdSender = (context.Session[CDKey.ServiceChoose] as tServices[])[i].fIdStores;
                l.fIsRead = false;
                l.fLetterOrChat = 1;
                l.fSendTime = DateTime.Now;
                db.tLetter.InsertOnSubmit(l);

                tLetter g = new tLetter();
                g.fIdReceiver = (context.Session[CDKey.ServiceChoose] as tServices[])[i].fIdStores;
                g.fContent = "來自新人 " + newname + " 的"+(context.Session[CDKey.ServiceChoose] as tServices[])[i].fName+" 服務方案請求，請盡快至專屬行事曆回覆該新人之請求";
                g.fIdSender = (context.Session[CDKey.LOGINUSER] as tMember).fIdMember;
                g.fIsRead = false;
                g.fLetterOrChat = 1;
                g.fSendTime = DateTime.Now;
                db.tLetter.InsertOnSubmit(g);
                db.SubmitChanges();

            }
        }
        context.Session[CDKey.ServiceChoose] = null;
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}