using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WeddingSite : System.Web.UI.Page
{
    ProcessServiceClassClick P = new ProcessServiceClassClick();
    FactoryDBDataContext db = new FactoryDBDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) {
            lblMsg.Visible = false;
            tMember mb = Session[CDKey.LOGINUSER] as tMember;
        if (mb == null) { 
            FormView1.Visible = false;
                lblMsg.Text = "登入即可留言";
            }

        processPage01(Label13);
       
        var table = from a in db.tDiscussion
                    join b in db.tMember on a.fIdMember equals b.fIdMember
                    where a.fIdTitle == Convert.ToInt32(Request["fIdTitle"])
                    select new { a.fIdTitle, a.fIdMember, a.fSendTime,a.fTitle, a.fContent, b.fIdentity ,b.fName,b.fPhoto};

        foreach (var s in table)
        {
                Label12.Text = "<div data-titleid=\"" + Request["fIdTitle"] + "\" class=\"container\"><div class=\"well\" style=\"border-radius:20px;\"><div class=\"media\"><a class=\"pull-left\" href=\"#\"><img class=\"media-object\" style=\"width: 71px; border-radius: 43px;\" src=\"" + (s.fPhoto == null ? "img/head.png" : s.fPhoto) + "\"></a><div class=\"media-body\"><h2 class=\"media-heading\" style=\"background-color:#FFB7DD;font-color:#000000;border-radius:20px;margin:0 20%;font-family:monospace;text-align: center;\">" + s.fTitle + "</h2><p class=\"text-left\">" + "發佈人:" + s.fName + "</p><p class=\"text-left\">" + "發表日期:" + s.fSendTime + "</p><br/><p style=\"font-size:16px;\">" + (s.fContent).Replace("\r\n", "<br/>") + "</p></div></div></div></div>";



            }


        }

    }
    //LABEL顯示回復
    public void processPage01(Label Label)
    {
        var table = from a in db.tDiscussionReply
                    join b in db.tMember on a.fIdMember equals b.fIdMember
                    join c in db.tDiscussion on a.fIdTitle equals c.fIdTitle
                    where a.fIdTitle == Convert.ToInt32(Request["fIdTitle"])
                    select new { a.fIdDiscussionReply, a.fIdTitle, a.fIdMember, a.fSendTime, a.fContent, b.fAccount, b.fPassword, b.fIdentity, b.fPhoto, b.fAddress, b.fEmail, b.fPhone, b.fName, c.fTitle };
        int countPage = 0;
        foreach (var s in table)
        {
            countPage++;
        }
        foreach (var s in table.Take(6))
        {
            Label.Text += "<div class=\"container\"><div class=\"well\"><div class=\"media\"><a class=\"pull-right\" href=\"#\"><img class=\"media-object\" style=\"width: 71px; border-radius: 43px;\" src=\"" + (s.fPhoto == null ? "img/head.png" : s.fPhoto) + "\" ></a><div class=\"media-body\"><h2 class=\"media-heading\">" + s.fTitle + "</h2><p class=\"text-right\">" + "發佈人:" + s.fName + "</p><p class=\"text-right\">" + "發表日期:" + s.fSendTime + "</p><br/><p style=\"font-size:18px;\">" + (s.fContent).Replace("\r\n", "<br/>") + "</p><ul class=\"list-inline list-unstyled\"></div></div></div></div>";
        }

        countPage = (countPage % 6 == 0 ? countPage / 6 : (countPage / 6) + 1);



        Label.Text += "<div class='row' style='text-align:center;'><div class='pagination pagination-centered paginationonedragon12'><ul>";
        for (int i = 1; i <= countPage; i++)
        {

            Label.Text += "<li" + (i == 1 ? " class='active'" : "") + "><a href='#'>" + i + "</a></li>";
        }
        Label.Text += "</ul></div></div>";
    }
    protected void FormView1_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        if (Request.Form["msg"].Length>0)
        {
            tMember mb = Session[CDKey.LOGINUSER] as tMember;
            e.Values["fIdTitle"] = Convert.ToInt32(Request["fIdTitle"]);
            e.Values["fIdMember"] = mb.fIdMember;
            e.Values["fSendTime"] = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            e.Values["fContent"] = Request.Form["msg"];
        }
        else
        {
            lblMsg.Visible = true;
            lblMsg.Text = "<div class='span2' style='border-radius:25px;background-color:red;margin:0 42%;text-align:center;color:white;'>留言必須填寫</div>";
        e.Cancel = true;
          }
    }

    protected void FormView1_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        Response.Redirect("forumMsg.aspx?fIdTitle="+ Request["fIdTitle"]);
    }
}