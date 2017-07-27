<%@ WebHandler Language="C#" Class="ProcessServiceSubClassTitle" %>

using System;
using System.Web;
using System.Collections.Generic;

public class ProcessServiceSubClassTitle : IHttpHandler {
    ProcessServiceClassClick p = new ProcessServiceClassClick();
    public void ProcessRequest (HttpContext context) {
        p.processServiceSubClassTitle(Convert.ToInt32(context.Request["id"]),context);
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}