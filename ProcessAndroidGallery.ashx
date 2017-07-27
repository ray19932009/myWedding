<%@ WebHandler Language="C#" Class="ProcessAndroidGallery" %>

using System;
using System.Web;
using System.Linq;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json;
using System.Collections.Generic;

public class ProcessAndroidGallery : IHttpHandler {
    FactoryDBDataContext db = new FactoryDBDataContext();
    List<string> ls = new List<string>();
    JArray ja = new JArray();
    public void ProcessRequest (HttpContext context) {
        var table = from t in db.tGalleryPhoto
                    where t.fIdGallery == Convert.ToInt32(context.Request["fid"])
                    select t;
        if (table.Count() > 0)
        {
            foreach(tGalleryPhoto g in table)
            {
                ls.Add(g.fPhoto);
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