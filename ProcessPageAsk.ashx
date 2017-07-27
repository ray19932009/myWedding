<%@ WebHandler Language="C#" Class="ProcessPage" %>

using System;
using System.Web;

public class ProcessPage : IHttpHandler {
    ProcessServiceClassClick p = new ProcessServiceClassClick();
    public void ProcessRequest (HttpContext context) {
        p.processPageAsk(context,(context.Request["page"]!=null?Convert.ToInt32(context.Request["page"])-1:0));
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}