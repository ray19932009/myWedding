<%@ WebHandler Language="C#" Class="processLike" %>

using System;
using System.Web;
    using System.Linq;
    using System.Web.SessionState;
public class processLike : IHttpHandler,IRequiresSessionState {
     FactoryDBDataContext db = new FactoryDBDataContext();
    public void ProcessRequest (HttpContext context) {
      if (context.Request["deleteOrInsert"] == "1")
        {
            tCollection lilike = new tCollection();
            lilike.fIdMember = (context.Session[CDKey.LOGINUSER] as tMember).fIdMember;  //要使用context取得session 
            lilike.fIdStores = Convert.ToInt32(context.Request["fid"]);  //使用context.request

            db.tCollection.InsertOnSubmit(lilike);
            db.SubmitChanges();
        }
        else
        {
            var table = from a in db.tCollection
                        where a.fIdMember == (context.Session[CDKey.LOGINUSER] as tMember).fIdMember && a.fIdStores == Convert.ToInt32(context.Request["fid"])
                        select a;

            if (table.Count() > 0)
            {
                foreach (tCollection b in table)
                {
                    db.tCollection.DeleteOnSubmit(b);
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