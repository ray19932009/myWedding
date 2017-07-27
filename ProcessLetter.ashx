<%@ WebHandler Language="C#" Class="ProcessLetter" %>

using System;
using System.Web;
using System.Web.SessionState;
using System.Linq;

public class ProcessLetter : IHttpHandler,IRequiresSessionState {
    ProcessLetters p = new ProcessLetters();
    FactoryDBDataContext db = new FactoryDBDataContext();
    public void ProcessRequest (HttpContext context) {
        if (context.Session[CDKey.LOGINUSER] != null)
        {
            if (context.Request["letterid"] == null)
            {
                tMember member = (tMember)context.Session[CDKey.LOGINUSER];
                p.ProcessLetterMsg(member,context,Convert.ToInt32(context.Request["page"]));
            } else
            {
                var table = from t in db.tLetter
                            where t.fIdILetter == Convert.ToInt32(context.Request["letterid"])
                            select t;
                if (table.Count() > 0)
                {
                    foreach(tLetter l in table)
                    {
                        l.fIsRead = true;
                        db.SubmitChanges();
                    }
                }
            }

        }

    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}