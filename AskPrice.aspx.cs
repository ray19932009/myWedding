using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AskPrice : System.Web.UI.Page
{

    FactoryDBDataContext db = new FactoryDBDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        tMember mb = Session[CDKey.LOGINUSER] as tMember;
        if (mb != null) { 
        if (mb.fIdentity == 1)
        {
            Label1.Text = "新人才能報價";
            Label1.Visible = true;
            Button1.Enabled = false;
        }

        }
        processPageAsk(Label2);
    }

    public void processPageAsk(Label Label)
    {
        var table = from a in db.tAskPrice
                    join b in db.tMember on a.fIdMember equals b.fIdMember
                    orderby a.fSendTime descending
                    select new {fIdTitle =a.fIdTitle,fSendTime = a.fSendTime,fTitle = a.fTitle ,fContent = a.fContent,fPhoto=b.fPhoto,fName=b.fName, content = a.fContent.Length > 50? a.fContent.Substring(1, 50) + "..." : a.fContent,a.fWantDay};
        int countPage = 0;
        foreach (var s in table)
        {
            countPage++;
        }
        foreach (var s in table.Take(6))
        {
            DateTime STime = DateTime.Now; //起始日
            DateTime ETime = s.fSendTime; //結束日
            TimeSpan Total = STime.Subtract(ETime); //日期相減
            double dayCount = Total.Days;
            int num = (from a in db.tAnswerPrice
                       where a.fIdTitle == s.fIdTitle
                       select a.fIdTitle).Count();


            Label.Text += "<div class=\"container\"><div class=\"well\" style=\"margin-right:30%; border-radius:20px;\"><div class=\"media\"><a class=\"pull-left\" href=\"#\"><img class=\"img-responsive\" alt=\"iamgurdeeposahan\" src=\"" + (s.fPhoto==null?"img/head.png":s.fPhoto) + "\" style=\"width: 71px; border-radius: 43px;\"></a><div class=\"media-body\"><h2 class=\"media-heading\"><a href=\"AskPriceMsg.aspx?fid=" + s.fIdTitle + "\">" + s.fTitle + "</a></h2><p class=\"text-left\" style=\"font-size:18px;\">" + s.fName + "</p><hr/><p style = \"font-size:16px;\" >" + s.content + "</p><hr/><ul class=\"list-inline list-unstyled\"><li><span><i class=\"glyphicon glyphicon-calendar\"></i> " + dayCount + "天前</span></li><li>|</li><span><i class=\"glyphicon glyphicon-comment\"></i> 共有"+num+"家廠商報價</span><li>|</li></ul></div></div></div></div>";
        }

        countPage = (countPage % 6 == 0 ? countPage / 6 : (countPage / 6) + 1);



        Label.Text += "<div class='row' style='text-align:center;'><div class='pagination pagination-centered paginationonedragonask'><ul>";
        for (int i = 1; i <= countPage; i++)
        {

            Label.Text += "<li" + (i == 1 ? " class='active'" : "") + "><a href='#'>" + i + "</a></li>";
        }
        Label.Text += "</ul></div></div>";
    }



    protected void Button1_Click(object sender, EventArgs e)
    {
        tMember mb = Session[CDKey.LOGINUSER] as tMember;
        if(mb != null) {
            Response.Redirect("Quotes.aspx");
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }
}
