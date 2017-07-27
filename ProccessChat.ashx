<%@ WebHandler Language="C#" Class="ProccessChat" %>

using System;
using System.Web;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.SessionState;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json;

public class ProccessChat : IHttpHandler,IRequiresSessionState {
    FactoryDBDataContext db = new FactoryDBDataContext();
    public void ProcessRequest (HttpContext context) {
        int page = 1;
        if (context.Request["page"] != null)
        {
            page = Convert.ToInt32(context.Request["page"]);
        }


        List<string> notread = new List<string>();
        List<int> anothersid = new List<int>();
        List<string> anothersname = new List<string>();
        string rowcontent = "", badge = "", paganation = "", strMsg = "";
        tMember loginUser = context.Session[CDKey.LOGINUSER] as tMember;
        JObject jobig = new JObject();
        JArray ja = new JArray();
        //找出哪些人與登入會員有Chat紀錄
        var table = ((from t in db.tLetter
                      join m in db.tMember on t.fIdSender equals m.fIdMember
                      where t.fLetterOrChat == 2 && t.fIdReceiver == loginUser.fIdMember
                      select new { anotherid = t.fIdSender, anothername = m.fName }).Distinct()).Union
                    ((from t in db.tLetter
                      join m in db.tMember on t.fIdReceiver equals m.fIdMember
                      where t.fLetterOrChat == 2 && t.fIdSender == loginUser.fIdMember
                      select new { anotherid = t.fIdReceiver, anothername = m.fName }).Distinct());
        int count = 0;
        int countPage = table.Count();
        countPage = (countPage % 10 == 0 ? countPage / 10 : (countPage / 10) + 1);
        if (table.Count() > 0)
        {
            foreach (var a in table.Skip((page - 1) * 10).Take(10))
            {
                anothersid.Add(a.anotherid);
                anothersname.Add(a.anothername);
                count++;
            }
        }

        //有幾個與他Chat的會員此迴圈就跑幾次
        for (int i = 0; i < count; i++)
        //for(int i=count-1;i>=0;i--)
        {
            //計算會員與其他與他有Chat的未讀訊息數量
            notread.Add((from n in db.tLetter
                         where n.fLetterOrChat == 2 && n.fIdReceiver == loginUser.fIdMember && n.fIsRead == false && n.fIdSender == anothersid[count-1-i]
                         select n).Count().ToString());

            strMsg += "<div class='row colinchatrow'>" +
        "<div class=\"span8 colinoutbolder\">" +
            "<div class=\"msgtitle\" data-chat=\"" + anothersid[count-1-i] + "\">" +
                 "<h4>與" + anothersname[count-1-i] + "的訊息紀錄" +
                      ((Convert.ToInt32(notread[i]) != 0) ? "<span class=\"pull-right badge\">" + notread[i] + "</span>" : "<span class=\"pull-right badge\"></span>") +
                 "</h4>" +
             "</div>" +
                         "<div class=\"msgcontent\">" +
                             "<div class=\"col-md-12\">" +
            "<div class=\"panel panel-primary\">" +
                "<div class=\"panel-body\">" +
                "<center><a href=\"#\" class=\"btn\" style=\"margin-bottom:10px;\" data-more=\"0\">顯示更多</a></center>" +
                    "<ul class=\"chat\" data-anotherid=\"" + anothersid[count-1-i] + "\">" +
            //產生對話框訊息內容
            /*p.ProcessRefreshChatBox(anothersid[i], loginUser.fIdMember, 0)*/
             "</ul>" +
                "</div>" +
                "<div class=\"panel-footer\">" +
                    "<div class=\"input-group colinchatfoot\">" +
                        "<input id='colininput' type='text' class='form-control input-md' placeholder='這邊輸入訊息...' />" +
                        "<span class=\"input-group-btn\">" +
                            "<a class=\"btn btn-warning btn-large colinchatsendstorerecieve\" id=\"btn-chat\">" +
                                "送出</a>" +
                        "</span>" +
                    "</div>" +
               "</div>" +
            "</div>" +
        "</div>" +
       "</div>" +
      "</div>" +
    "</div>";

            rowcontent = "<div class='row colinchatrow'>" +
    "<div class=\"span8 colinoutbolder\">" +
        "<div class=\"msgtitle\" data-chat=\"" + anothersid[count-1-i] + "\">" +
             "<h4>與" + anothersname[count-1-i] + "的訊息紀錄" +
                  ((Convert.ToInt32(notread[i]) != 0) ? "<span class=\"pull-right badge\">" + notread[i] + "</span>" : "<span class=\"pull-right badge\"></span>") +
             "</h4>" +
         "</div>" +
                     "<div class=\"msgcontent\">" +
                         "<div class=\"col-md-12\">" +
        "<div class=\"panel panel-primary\">" +
            "<div class=\"panel-body\">" +
            "<center><a href=\"#\" class=\"btn\" style=\"margin-bottom:10px;\" data-more=\"0\">顯示更多</a></center>" +
                "<ul class=\"chat\" data-anotherid=\"" + anothersid[count-1-i] + "\">" +
         //產生對話框訊息內容
         /*p.ProcessRefreshChatBox(anothersid[i], loginUser.fIdMember, 0)*/
         "</ul>" +
            "</div>" +
            "<div class=\"panel-footer\">" +
                "<div class=\"input-group colinchatfoot\">" +
                    "<input id='colininput' type='text' class='form-control input-md' placeholder='這邊輸入訊息...' />" +
                    "<span class=\"input-group-btn\">" +
                        "<a class=\"btn btn-warning btn-large colinchatsendstorerecieve\" id=\"btn-chat\">" +
                            "送出</a>" +
                    "</span>" +
                "</div>" +
           "</div>" +
        "</div>" +
    "</div>" +
   "</div>" +
  "</div>" +
"</div>";
            JObject jo = new JObject();
            jo.Add("anotherid",anothersid[count-1-i].ToString());
            jo.Add("rowcontent",rowcontent);
            jo.Add("badge", (Convert.ToInt32(notread[i]) != 0) ? notread[i] : "");
            ja.Add(jo);
        }
        paganation += "<div class='row' style='text-align:center;'><div class='pagination pagination-centered paginationchat'><ul>";
        /*strMsg += "<div class='row' style='text-align:center;'><div class='pagination pagination-centered paginationchat'><ul>";*/
        for (int g = 1; g <= countPage; g++)
        {
            /*strMsg += "<li" + (g == page ? " class='active'" : "") + "><a href='WeddingChat.aspx?page=" + g + "'>" + g + "</a></li>";*/
            paganation += "<li" + (g == page ? " class='active'" : "") + "><a href='WeddingChat.aspx?page=" + g + "'>" + g + "</a></li>";
        }
        /*strMsg += "</ul></div></div>";*/
        paganation += "</ul></div></div>";
        jobig.Add("allcontent", strMsg);
        jobig.Add("paganation", paganation);
        jobig.Add("allrowcontent",ja);
        context.Response.Write(JsonConvert.SerializeObject(jobig));
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}