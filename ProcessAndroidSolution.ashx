<%@ WebHandler Language="C#" Class="ProcessAndroidSolution" %>

using System;
using System.Web;
using System.Linq;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json;
using System.Collections.Generic;

public class ProcessAndroidSolution : IHttpHandler {
    FactoryDBDataContext db = new FactoryDBDataContext();
        List<string> ls = new List<string>();
        JArray ja = new JArray();
    public void ProcessRequest (HttpContext context) {
        var table = from t in db.tServicesPic
                    join g in db.tGalleryPhoto on t.fIdPhoto equals g.fIdPhoto
                    where t.fIdServices == Convert.ToInt32(context.Request["fid"])
                    select new { picturepath=g.fPhoto};
        if (table.Count() > 0)
        {
            foreach(var p in table)
            {
                    ls.Add(p.picturepath);
            }
            ja.Add(ls);
        }
        context.Response.Write(JsonConvert.SerializeObject(ja));
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}