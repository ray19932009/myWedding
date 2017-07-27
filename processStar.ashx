<%@ WebHandler Language="C#" Class="processStar" %>

using System;
using System.Web;
using System.Linq;
using System.Web.SessionState;

public class processStar : IHttpHandler,IRequiresSessionState{  //泛型處理常識取得session 要先繼承
    FactoryDBDataContext db = new FactoryDBDataContext();
    public void ProcessRequest (HttpContext context) {
        if (context.Request["deleteOrInsert"] == "1")
        {
            tLIkeServices lilike = new tLIkeServices();
            lilike.fidMember = (context.Session[CDKey.LOGINUSER] as tMember).fIdMember;  //要使用context取得session 
            lilike.fidServices = Convert.ToInt32(context.Request["serviceId"]);  //使用context.request

            db.tLIkeServices.InsertOnSubmit(lilike);
            db.SubmitChanges();
        }
        else
        {
            var table = from a in db.tLIkeServices
                        where a.fidMember == (context.Session[CDKey.LOGINUSER] as tMember).fIdMember && a.fidServices == Convert.ToInt32(context.Request["serviceId"])
                        select a;

            if (table.Count() > 0)
            {
                foreach (tLIkeServices b in table)
                {
                    db.tLIkeServices.DeleteOnSubmit(b);
                    db.SubmitChanges();

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