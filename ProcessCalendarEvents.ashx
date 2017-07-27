<%@ WebHandler Language="C#" Class="ProcessCalendarEvents" %>

using System;
using System.Web;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.Linq;
using System.Web.SessionState;


public class ProcessCalendarEvents : IHttpHandler,IRequiresSessionState {
    FactoryDBDataContext db = new FactoryDBDataContext();

    public void ProcessRequest (HttpContext context) {
        JArray ja = new JArray();

        if((context.Session[CDKey.LOGINUSER] as tMember).fIdentity == 0)
        {//新人
            var table = from t in db.tCalendar
                    join s in db.tServices on t.fIdServices equals s.fIdServices
                    join m in db.tMember on s.fIdStores equals m.fIdMember
                    where t.fIdMember == (context.Session[CDKey.LOGINUSER] as tMember).fIdMember && t.fAccepted == true
            select new { calendarid=t.fIdCalendar,servicename=s.fName,storename=m.fName,date=t.fDate};
                if (table!=null)
        {
            foreach(var c in table)
            {
                JObject jo = new JObject();
                jo.Add("id", c.calendarid);
                jo.Add("title", "<a class='btn btn-large btn-primary btn-block'>" + c.storename + "<br/></a>");
                jo.Add("start", c.date);
                ja.Add(jo);

            }
        }

        }
        else
        {//廠商
            var table = from t in db.tCalendar
                    join s in db.tServices on t.fIdServices equals s.fIdServices
                    join m in db.tMember on t.fIdMember equals m.fIdMember
                    where t.fIdStores == (context.Session[CDKey.LOGINUSER] as tMember).fIdMember && t.fAccepted == true
                    select new { calendarid=t.fIdCalendar,servicename=s.fName,newname=m.fName,date=t.fDate};
                if (table!=null)
        {
            foreach(var c in table)
            {
                JObject jo = new JObject();
                jo.Add("id", c.calendarid);
                jo.Add("title", "<a class='btn btn-large btn-primary btn-block'>" + c.newname + "<br/></a>");
                jo.Add("start", c.date);
                ja.Add(jo);

            }
        }
        }
        

        context.Response.Write(JsonConvert.SerializeObject(ja));
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}