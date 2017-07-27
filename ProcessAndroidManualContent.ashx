<%@ WebHandler Language="C#" Class="ProcessAndroidManualContent" %>

using System;
using System.Web;
using System.Linq;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json;
using System.Collections.Generic;

public class ProcessAndroidManualContent : IHttpHandler {
    FactoryDBDataContext db = new FactoryDBDataContext();
    String Content;
    JArray ja = new JArray();
    public void ProcessRequest (HttpContext context) {
        var table = from t in db.tManual
                    where t.fidManual == Convert.ToInt32(context.Request["fid"])
                    select t;

        if (table.Count() > 0)
        {
            foreach(tManual m in table)
            {
                Content = m.fContent;
            }            
        }
        context.Response.Write(Content);
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}