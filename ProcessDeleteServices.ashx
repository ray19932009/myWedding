<%@ WebHandler Language="C#" Class="ProcessDeleteServices" %>

using System;
using System.Web;
using System.Web.SessionState;

public class ProcessDeleteServices : IHttpHandler,IRequiresSessionState  {
    ProcessServiceClassClick p = new ProcessServiceClassClick();
    public void ProcessRequest (HttpContext context) {
        p.ProcessDeleteServices(Convert.ToInt32(context.Request["delclass"]),context);
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}