<%@ WebHandler Language="C#" Class="ProcessChooseServices" %>

using System;
using System.Web;
using System.Web.SessionState;
using System.Linq;
public class ProcessChooseServices : IHttpHandler,IRequiresSessionState {
    FactoryDBDataContext db = new FactoryDBDataContext();
    public void ProcessRequest (HttpContext context) {
        tMember loginMember=context.Session[CDKey.LOGINUSER] as tMember;
        int serviceid = Convert.ToInt32(context.Request["serviceid"]);
        tServices services=null;
        string date = "";
        string newname="", storename="";
        var table = from t in db.tMember
                    where t.fIdMember == loginMember.fIdMember || t.fIdMember == serviceid
                    select new { name=t.fName,iden=t.fIdentity};
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
        var service = from s in db.tServices
                      where s.fIdServices == serviceid
                      select s;
        if (service.Count() > 0)
        {
            foreach(tServices ser in service)
            {
                services = ser;
            }
        }
        date = context.Request["date"];

        tCalendar x = new tCalendar();
        x.fDate = Convert.ToDateTime(date);
        x.fIdMember = loginMember.fIdMember;
        x.fIdServices = services.fIdServices;
        x.fIdStores = services.fIdStores;
        x.fAccepted = false;
        db.tCalendar.InsertOnSubmit(x);

        tLetter l = new tLetter();
        l.fIdReceiver = loginMember.fIdMember;
        l.fContent = services.fName+" 服務方案請求已寄送給 " + storename + " 廠商，待其接受確認後便會加入專屬行事曆，您可前往專屬行事曆查看所有已接受及等待接受之服務";
        l.fIdSender = services.fIdStores;
        l.fIsRead = false;
        l.fLetterOrChat = 1;
        l.fSendTime = DateTime.Now;
        db.tLetter.InsertOnSubmit(l);

        tLetter g = new tLetter();
        g.fIdReceiver = services.fIdStores;
        g.fContent = "來自新人 " + newname + " 的"+services.fName+" 服務方案請求，請盡快至專屬行事曆回覆該新人之請求";
        g.fIdSender = loginMember.fIdMember;
        g.fIsRead = false;
        g.fLetterOrChat = 1;
        g.fSendTime = DateTime.Now;
        db.tLetter.InsertOnSubmit(g);
        db.SubmitChanges();
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}