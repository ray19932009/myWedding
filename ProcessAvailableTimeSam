<%@ WebHandler Language="C#" Class="ProcessAvailableTimeSam" %>

using System;
using System.Web;
using System.Web.SessionState;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.Linq;

public class ProcessAvailableTimeSam : IHttpHandler {

    FactoryDBDataContext db = new FactoryDBDataContext();
    List<string> strDate = new List<string>();
    JArray ja = new JArray();
    public void ProcessRequest (HttpContext context) {
        var table = from t in db.tAvailableTime
                    where t.fIdStores==Convert.ToInt32(context.Request["storeid"])
                    select t;
        if (table.Count() > 0)
        {
            foreach (tAvailableTime a in table)
            {

                strDate.Add(Convert.ToDateTime(a.fAvailableTime).ToString("yyyy-MM-dd"));
            }
            
            ja.Add(strDate);
           
        }
        context.Response.Write(JsonConvert.SerializeObject(ja));
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}