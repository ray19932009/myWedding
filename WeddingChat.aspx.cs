using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

public partial class Chat : System.Web.UI.Page
{
    ProcessChatMsg p = new ProcessChatMsg();
    FactoryDBDataContext db = new FactoryDBDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        int page = 1;
        if (Request["page"] != null)
        {
            page = Convert.ToInt32(Request["page"]);
        }
        
        string strMsg = "";
        List<int> notread = new List<int>();
        List<int> anothersid = new List<int>();
        List<string> anothersname = new List<string>();
        tMember loginUser = Session[CDKey.LOGINUSER] as tMember;
        //找出哪些人與登入會員有Chat紀錄
        var table = ((from t in db.tLetter
                      join m in db.tMember on t.fIdSender equals m.fIdMember                      
                      where t.fLetterOrChat == 2 && t.fIdReceiver == loginUser.fIdMember
                      select new { anotherid = t.fIdSender,anothername=m.fName }).Distinct()).Union
                    ((from t in db.tLetter
                      join m in db.tMember on t.fIdReceiver equals m.fIdMember
                      where t.fLetterOrChat == 2 && t.fIdSender == loginUser.fIdMember
                      select new { anotherid=t.fIdReceiver, anothername = m.fName }).Distinct());
        int count = 0;
        int countPage = table.Count();
        countPage = (countPage % 10 == 0 ? countPage / 10 : (countPage / 10) + 1);
        if (table.Count() > 0)
        {            
            foreach (var a in table.Skip((page-1)*10).Take(10))
            {
                anothersid.Add(a.anotherid);
                anothersname.Add(a.anothername);
                count++;
            }
        }
        
        //有幾個與他Chat的會員此迴圈就跑幾次
        for (int i = 0; i < count; i++)
        {
            //計算會員與其他與他有Chat的未讀訊息數量
            notread.Add((from n in db.tLetter
                          where n.fLetterOrChat == 2 && n.fIdReceiver == loginUser.fIdMember && n.fIsRead == false && n.fIdSender == anothersid[i]
                          select n).Count());
            strMsg += "<div class='row'>"+
        "<div class=\"span8 colinoutbolder\">"+
            "<div class=\"msgtitle\" data-chat=\"" + anothersid[i] + "\">" +
                 "<h4>來自" + anothersname[i] + "的訊息"+
                      ((Convert.ToInt32(notread[i])!=0)?"<span class=\"pull-right badge\">" + notread[i] + "</span>":"") +
                 "</h4>"+
             "</div>"+
                         "<div class=\"msgcontent\">"+
                             "<div class=\"col-md-12\">"+
            "<div class=\"panel panel-primary\">"+                
                "<div class=\"panel-body\">"+
                "<center><a href=\"#\" class=\"btn\" style=\"margin-bottom:10px;\" data-more=\"0\">顯示更多</a></center>"+
                    "<ul class=\"chat\" data-anotherid=\""+ anothersid[i] + "\">" +
            //產生對話框訊息內容
            /*p.ProcessRefreshChatBox(anothersid[i], loginUser.fIdMember, 0)*/
             "</ul>"+
                "</div>"+
                "<div class=\"panel-footer\">"+
                    "<div class=\"input-group colinchatfoot\">" +
                        "<input id='colininput' type='text' class='form-control input-sm' placeholder='這邊輸入訊息...' />"+
                        "<span class=\"input-group-btn\">"+
                            "<a class=\"btn btn-warning btn-sm colinchatsendstorerecieve\" id=\"btn-chat\">" +
                                "送出</a>"+
                        "</span>"+
                    "</div>"+
               "</div>"+
            "</div>"+
        "</div>"+
       "</div>"+
      "</div>"+
    "</div>";
            
        }
        strMsg += "<div class='row' style='text-align:center;'><div class='pagination pagination-centered paginationchat'><ul>";
        for (int g = 1; g <= countPage; g++)
        {
            strMsg += "<li" + (g == page ? " class='active'" : "") + "><a href='WeddingChat.aspx?page="+g+"'>" + g + "</a></li>";
        }
        strMsg += "</ul></div></div>";
        MainMsg.Text = strMsg;
    }
}