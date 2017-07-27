<%@ WebHandler Language="C#" Class="ProcessSendToCalendarCase" %>

using System;
using System.Web;
using System.Linq;
using System.Web.SessionState;

public class ProcessSendToCalendarCase : IHttpHandler,IRequiresSessionState {
    FactoryDBDataContext db = new FactoryDBDataContext();
    public void ProcessRequest(HttpContext context) {
        string date = "";
        string newname = "", storename = "";

        var table = from s in db.tMember
                    where s.fIdMember == (context.Session[CDKey.LOGINUSER] as tMember).fIdMember || s.fIdMember == Convert.ToInt32(context.Request["storeid"])
                    select new { name = s.fName, iden = s.fIdentity };
        if (table.Count() > 0)
        {
            foreach (var n in table)
            {
                if (0 == n.iden) {
                    newname = n.name;
                } else
                {
                    storename = n.name;
                }
            }

            date = context.Request["date"];
            tCalendar x = new tCalendar();
            x.fDate = Convert.ToDateTime(date);
            x.fIdMember = (context.Session[CDKey.LOGINUSER] as tMember).fIdMember;
            x.fIdServices = Convert.ToInt32(context.Request["servicesid"]);
            x.fIdStores = Convert.ToInt32(context.Request["storeid"]);
            x.fAccepted = true;
            db.tCalendar.InsertOnSubmit(x);

            tAvailableTime a = new tAvailableTime();
            a.fAvailableTime = Convert.ToDateTime(date);
            a.fIdStores = Convert.ToInt32(context.Request["storeid"]);
            db.tAvailableTime.InsertOnSubmit(a);

            tLetter l = new tLetter();
            l.fIdReceiver = (context.Session[CDKey.LOGINUSER] as tMember).fIdMember;
            l.fContent = "您已經與" + storename + "廠商配對成功！詳細時間請於專屬行事曆查看";
            l.fIdSender = Convert.ToInt32(context.Request["storeid"]);
            l.fIsRead = false;
            l.fLetterOrChat = 1;
            l.fSendTime = DateTime.Now;
            db.tLetter.InsertOnSubmit(l);

            tLetter g = new tLetter();
            g.fIdReceiver = Convert.ToInt32(context.Request["storeid"]);
            g.fContent = "您已經與" + newname + "新人配對成功！詳細時間請於專屬行事曆查看";
            g.fIdSender = (context.Session[CDKey.LOGINUSER] as tMember).fIdMember;
            g.fIsRead = false;
            g.fLetterOrChat = 1;
            g.fSendTime = DateTime.Now;
            db.tLetter.InsertOnSubmit(g);
            db.SubmitChanges();
        }



    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}