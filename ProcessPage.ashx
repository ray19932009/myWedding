<%@ WebHandler Language="C#" Class="ProcessPage" %>

using System;
using System.Web;

public class ProcessPage : IHttpHandler {
    ProcessServiceClassClick p = new ProcessServiceClassClick();
    public void ProcessRequest (HttpContext context) {
            p.processPage(Convert.ToInt32(context.Request["subclass"]),Convert.ToInt32(context.Request["class"]),context,(context.Request["page"]!=null?Convert.ToInt32(context.Request["page"])-1:0),Convert.ToInt32(context.Request["sort"]),Convert.ToInt32(context.Request["city"]));
    }

 
    public bool IsReusable {
        get {
            return false;
        }
    }

}