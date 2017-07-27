<%@ WebHandler Language="C#" Class="ProcessCalendarEventsContent" %>

using System;
using System.Web;
using System.Linq;

public class ProcessCalendarEventsContent : IHttpHandler {
    FactoryDBDataContext db = new FactoryDBDataContext();
    public void ProcessRequest (HttpContext context) {
        string strMsg = "", storename = "", newname = "";
        int id = Convert.ToInt32(context.Request["id"]);
        var table = from t in db.tCalendar
                    join s in db.tServices on t.fIdServices equals s.fIdServices
                    where t.fIdCalendar == id
                    select new { storeid=t.fIdStores,memberid=t.fIdMember,servicename=s.fName,servicecontent=s.fContent,price=s.fMaxMoney};
        if (table.Count() > 0)
        {
            foreach (var s in table)
            {
                var name = from n in db.tMember
                           where n.fIdMember == s.storeid || n.fIdMember == s.memberid
                           select new { identity=n.fIdentity,name=n.fName};
                if (name.Count() > 0)
                {
                    foreach(var m in name)
                    {
                        if (m.identity == 0)
                            newname = m.name;
                        else
                            storename = m.name;
                    }
                }
                strMsg += "<a class='btn btn-large' style='cursor:default;margin:5px;'>廠商</a>"+storename+"<br/><a class='btn btn-large' style='cursor:default;margin:5px;'>新人</a>"+newname+"<br/>" +
                        "<a class='btn btn-large' style='cursor:default;margin:5px;'>價格</a><span style='color:#F00;'>NT$"+s.price+"</span><br/>" +
                        "<a class='btn btn-large' style='cursor:default;margin:5px;'>服務方案</a>"+s.servicename+"<br/>" +
                        "<a class='btn btn-large' style='cursor:default;margin:5px;'>服務內容</a><br/><div class='colinwell' style='text-align:left;width:100%;height:300px;overflow: scroll;overflow-x: hidden;'>"+s.servicecontent+"</div>";
            }
        }
        context.Response.Write(strMsg);
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}