using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WeddingSite : System.Web.UI.Page
{
    FactoryDBDataContext db = new FactoryDBDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) { 
        lblMessage.Visible = false;
          tMember mb = Session[CDKey.LOGINUSER] as tMember;
        if (mb == null)
        {
                lblTitle.Visible = true;
                lblTitle.Text = "<div class='span3' style='border-radius:25px;background-color:red;margin:0 42%;text-align:center;color:white;'>登入即可發起討論</div>";
            FormView1.Visible = false;
        }
           
            processPageforum(Label2);
        }
    }
    public void processPageforum(Label Label)
    {
        var table = from a in db.tDiscussion
                    join b in db.tMember on a.fIdMember equals b.fIdMember
                    orderby a.fSendTime descending
                    select new { a.fIdTitle, a.fIdMember, a.fSendTime,a.fTitle,a.fContent, b.fAccount, b.fPassword, b.fIdentity, b.fPhoto, b.fAddress, b.fEmail, b.fPhone, b.fName,content = a.fContent.Length > 20 ? a.fContent.Substring(0, 20) + "..." : a.fContent }
                     ;
        int countPage = 0;

        foreach (var s in table)
        {
            countPage++;
        }
  


        foreach (var s in table.Take(6))
        {

           int Num = (from a in db.tDiscussionReply
                         where a.fIdTitle == s.fIdTitle              
                         select a.fIdTitle).Count();
           
            DateTime STime = DateTime.Now; //起始日
            DateTime ETime = (DateTime)(s.fSendTime); //結束日
            TimeSpan Total = STime.Subtract(ETime); //日期相減
            double dayCount = Total.Days;
            Label.Text += "<div class=\"container\"><div class=\"well\"><div class=\"media\"><a class=\"pull-left\" href=\"#\"><img class=\"img-responsive\" alt=\"iamgurdeeposahan\" src=\"" + (s.fPhoto == null ? "img/head.png" : s.fPhoto) + "\" style=\"width: 71px; border-radius: 43px;\"></a><div class=\"media-body\"><h2 class=\"media-heading\"><a href=forumMsg.aspx?fIdTitle="+ s.fIdTitle+">" + s.fTitle + "</a></h2><p class=\"text-left\" style=\"font-size:18px;\">" + s.fName + "</p><hr/><p style = \"font-size:16px;\" >" + s.content + "</p><hr/><ul class=\"list-inline list-unstyled\"><li><span><i class=\"glyphicon glyphicon-calendar\"></i> " + (Convert.ToString(dayCount) == "0" ?"今天發佈": Convert.ToString(dayCount)+"天前發佈") + "</span></li><li>|</li><span><i class=\"glyphicon glyphicon-comment\"></i> 共有則"+ Num + "回覆</span><li>|</li></ul></div></div></div></div>";
        }
         
        countPage = (countPage % 6 == 0 ? countPage / 6 : (countPage / 6) + 1);



        Label.Text += "<div class='row' style='text-align:center;'><div class='pagination pagination-centered paginationonedragonforum'><ul>";
        for (int i = 1; i <= countPage; i++)
        {

            Label.Text += "<li" + (i == 1 ? " class='active'" : "") + "><a href='#'>" + i + "</a></li>";
        }
        Label.Text += "</ul></div></div>";
    }

    protected void FormView1_ItemInserting(object sender, FormViewInsertEventArgs e)
    {

        tMember mb = Session[CDKey.LOGINUSER] as tMember;
    
        if (string.IsNullOrEmpty(Request.Form["teatarea1"].ToString()))
        {
            lblMessage.Visible = true;
            lblMessage.Text = "<div class='span2' style='border-radius:25px;background-color:red;margin:0 42%;text-align:center;color:white;'>留言必須填寫</div>";
            e.Cancel = true;
        }
        if (Request.Form["teatarea1"].ToString().Length < 15)
        {
            lblMessage.Visible = true;
            lblMessage.Text = "<div class='span3' style='border-radius:25px;background-color:red;margin:0 42%;text-align:center;color:white;'>留言必須大於15個字</div>";
            e.Cancel = true;
        }
        if (e.Values["fTitle"].ToString().Length <= 0 || e.Values["fTitle"].ToString().Length >= 30)
        {
            lblMessage.Visible = true;
            lblMessage.Text = "<div class='span4' style='border-radius:25px;background-color:red;margin:0 42%;text-align:center;color:white;'>主題必須填寫 並且少於30個字</div>";
            e.Cancel = true;
        }
        e.Values["fSendTime"] = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
        // 取得session 紀錄姓名
        e.Values["fIdMember"] = mb.fIdMember;
        e.Values["fContent"]= Request.Form["teatarea1"].Replace("\r\n", "<br/>");
        

    }


    protected void FormView1_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        Response.Redirect(Request.Url.ToString());
    }
}
 