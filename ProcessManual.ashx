<%@ WebHandler Language="C#" Class="ProcessManual" %>

using System;
using System.Web;

public class ProcessManual : IHttpHandler {
    ProcessServiceClassClick p = new ProcessServiceClassClick();
    public void ProcessRequest (HttpContext context) {
        p.processMaual(Convert.ToInt32(context.Request["id"]),context);
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}