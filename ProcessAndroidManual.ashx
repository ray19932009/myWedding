<%@ WebHandler Language="C#" Class="ProcessAndroidManual" %>

using System;
using System.Web;
using System.Linq;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json;
using System.Collections.Generic;

public class ProcessAndroidManual : IHttpHandler {
    FactoryDBDataContext db = new FactoryDBDataContext(); 
    JArray ja = new JArray();
    public void ProcessRequest (HttpContext context) {
        var table = from t in db.tManual
                    where t.fidServicesClass == Convert.ToInt32(context.Request["class"])
                    select t;
        if (table.Count() > 0)
        {
            foreach(tManual m in table)
            {
                JObject jo = new JObject();
                jo.Add("id",m.fidManual);
                jo.Add("Title",m.fTitle);
                ja.Add(jo);
            }
            
            //jo.Add("服務類別"+context.Request["class"]+"Title",ja);
        }
        context.Response.Write(JsonConvert.SerializeObject(ja));
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}