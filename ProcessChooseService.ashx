<%@ WebHandler Language="C#" Class="ProcessChooseService" %>

using System;
using System.Web;
using System.Web.SessionState;

public class ProcessChooseService : IHttpHandler,IRequiresSessionState {
    ProcessServiceClassClick p = new ProcessServiceClassClick();
    public void ProcessRequest (HttpContext context) {
        p.ProcessChooseService(Convert.ToInt32(context.Request["serviceid"]), context,Convert.ToInt32(context.Request["serviceclass"]));
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}