<%@ WebHandler Language="C#" Class="ProcessRefreshChatMsg" %>

using System;
using System.Web;
using System.Web.SessionState;
using System.Linq;

public class ProcessRefreshChatMsg : IHttpHandler,IRequiresSessionState {
    ProcessChatMsg p = new ProcessChatMsg();
    FactoryDBDataContext db = new FactoryDBDataContext();
    public void ProcessRequest (HttpContext context) {
        context.Response.Write(p.ProcessRefreshChatBox(Convert.ToInt32(context.Request["anotherid"]), (context.Session[CDKey.LOGINUSER] as tMember).fIdMember, 0));
        var table = from t in db.tLetter
                    where t.fIdSender == Convert.ToInt32(context.Request["anotherid"]) && (context.Session[CDKey.LOGINUSER] as tMember).fIdMember == t.fIdReceiver&&
                    t.fLetterOrChat==2
                    select t;
        if (table.Count() > 0)
        {
            foreach(var n in table)
            {
                n.fIsRead = true;                
                db.SubmitChanges();
            }
        }
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}