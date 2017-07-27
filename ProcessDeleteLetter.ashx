<%@ WebHandler Language="C#" Class="ProcessDeleteLetter" %>

using System;
using System.Web;
using System.Linq;

public class ProcessDeleteLetter : IHttpHandler {
    FactoryDBDataContext db = new FactoryDBDataContext();
    public void ProcessRequest (HttpContext context) {
        var table = from t in db.tLetter
                    where t.fIdILetter==Convert.ToInt32(context.Request["letterid"])
                    select t;
        if (table.Count() > 0)
        {
            foreach(tLetter l in table)
            {
                db.tLetter.DeleteOnSubmit(l);
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