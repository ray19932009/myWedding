<%@ WebHandler Language="C#" Class="ProcessChat" %>

using System;
using System.Web;
using System.Web.SessionState;

public class ProcessChat : IHttpHandler,IRequiresSessionState {
    ProcessChatMsg p = new ProcessChatMsg();
    public void ProcessRequest (HttpContext context) {
        p.ProcessSend(context.Request["content"], (context.Session[CDKey.LOGINUSER] as tMember).fIdMember, Convert.ToInt32(context.Request["storeid"]));
            context.Response.Write(p.ProcessRefreshChatBox(Convert.ToInt32(context.Request["storeid"]),(context.Session[CDKey.LOGINUSER] as tMember).fIdMember,0));
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}