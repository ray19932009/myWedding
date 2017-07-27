<%@ WebHandler Language="C#" Class="ProcessAvailableTime" %>

using System;
using System.Web;
using System.Web.SessionState;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.Linq;

public class ProcessAvailableTime : IHttpHandler,IRequiresSessionState {
    FactoryDBDataContext db = new FactoryDBDataContext();
    List<String> strDate = new List<string>();
    public void ProcessRequest (HttpContext context) {
        JObject jo = new JObject();
        tServices[] s =(context.Session[CDKey.ServiceChoose] as tServices[]);
        for(int i = 0; i <= 3; i++)
        {
            if (s[i] != null)
            {
                var table = from t in db.tAvailableTime
                            where t.fIdStores==s[i].fIdStores
                            select t;
                if (table.Count() > 0)
                {
                    foreach(tAvailableTime a in table)
                    {

                        strDate.Add(Convert.ToDateTime(a.fAvailableTime).ToString("yyyy-MM-dd"));
                    }
                    JArray ja = new JArray();
                    ja.Add(strDate);
                    jo.Add("c"+i, ja);
                    strDate.Clear();
                }
            }

        }
        context.Response.Write(JsonConvert.SerializeObject(jo));
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}