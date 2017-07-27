using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AskPrice : System.Web.UI.Page
{

    FactoryDBDataContext db = new FactoryDBDataContext();
   public string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        tMember mb = Session[CDKey.LOGINUSER] as tMember;

        var table = from a in db.tAskPrice
                    join b in db.tMember on a.fIdMember equals b.fIdMember
                    where a.fIdTitle == Convert.ToInt32(Request["fid"])
                    select new { fIdTitle = a.fIdTitle, fSendTime = a.fSendTime, fTitle = a.fTitle, fContent = a.fContent, fPhoto = b.fPhoto, fName = b.fName,b.fIdentity,a.fWantDay};

        foreach (var s in table)
        {
            title = s.fTitle;
            string date = "";
            date = Convert.ToDateTime(s.fWantDay).ToString("yyyy/MM/dd");
            Label2.Text += "<div class=\"container\"><div class=\"well\" style=\"margin-right:30%;\"><div class=\"media\"><a class=\"pull-left\" style=\"color:#077; text-decoration:none;\" href=\"StoreInfo.aspx?\"><img class=\"img-responsive\" alt=\"iamgurdeeposahan\" src=\"" + (s.fPhoto == null ? "img/head.png" : s.fPhoto) + "\" style=\"width: 71px; border-radius: 43px;\">" + s.fName + "</a><div class=\"media-body\"><h2 class=\"media-heading\">" + s.fTitle + "</h2><p class=\"text-left\" style=\"font-size:18px;\"></p class=\"text-left\" style=\"font-size:18px;\"><p class=\"text-left\" style=\"font-size:10px;\">於" + Convert.ToDateTime(s.fSendTime).ToString("yyyy/MM/dd HH:mm:ss") + "刊登</p><br/><p style = \"font-size:16px;\" >" + s.fContent + "</p><a data-askid='" + s.fIdTitle + "' data-identity='" + (mb !=null ? (mb.fIdentity).ToString() : "3") + "' data-storeid='"+ (mb != null ? (mb.fIdMember).ToString() : "0") + "' data-date='" + date + "' class='btn btn-info btn-large'>我要報價</a></div></div></div></div>";
        }



        processPageAnswer(Label3);
    }

    public void processPageAnswer(Label Label)
    {
        tMember mb = Session[CDKey.LOGINUSER] as tMember;
        var table = from a in db.tAnswerPrice
                    join b in db.tAskPrice on a.fIdTitle equals b.fIdTitle
                    join c in db.tMember on a.fIdStore equals c.fIdMember
                    join e in db.tServices on a.fIdServices equals e.fIdServices
                    where a.fIdTitle == Convert.ToInt32(Request["fid"])
                    select new { a.fContent, a.fIdServices, a.fIdStore, a.fIdTitle, a.fSendTime, c.fName, c.fPhoto, b.fTitle, b.fWantDay,e.fMaxMoney };
        int countPage = 0;
        foreach (var s in table)
        {
            countPage++;
        }
        foreach (var s in table.Take(6))
        {
            string date = "";
            date = Convert.ToDateTime(s.fWantDay).ToString("yyyy/MM/dd");
            Label.Text += "<div class=\"container\"><div class=\"well\" style=\"margin-right:30%;background-color:#cfcfcf\"><div class=\"media\"><a class=\"pull-left\" href=\"#\"><img class=\"img-responsive\" alt=\"iamgurdeeposahan\" src=\"" + (s.fPhoto == null ? "img/head.png" : s.fPhoto) + "\" style=\"width: 71px; border-radius: 43px;\"></a><div class=\"media-body\"><h2 class=\"media-heading\">" + s.fName + "</h2><p class=\"text-left\" style=\"font-size:18px;\"></p><p class=\"text-left\" style=\"font-size:10px;\">於" + Convert.ToDateTime(s.fSendTime).ToString("yyyy/MM/dd HH:mm:ss") + "報價</p><br /><p>價格:"+s.fMaxMoney+"</p><br/><p style = \"font-size:16px;\" >" + (s.fContent).Replace("\r\n","<br/>") + "</p><a data-answerid='" + s.fIdTitle + "' data-answerstoreid='" +s.fIdStore + "' data-servicesid='" + s.fIdServices + "'  data-identity='" + (mb != null ? (mb.fIdentity).ToString() : "3") + "' data-date='" + date + "' class='btn btn-info btn-large'>我要選此方案</a></div></div></div></div>";
        }

        countPage = (countPage % 6 == 0 ? countPage / 6 : (countPage / 6) + 1);



        Label.Text += "<div class='row' style='text-align:center;'><div class='pagination pagination-centered paginationonedragonAnswer'><ul>";
        for (int i = 1; i <= countPage; i++)
        {

            Label.Text += "<li" + (i == 1 ? " class='active'" : "") + "><a href='#'>" + i + "</a></li>";
        }
        Label.Text += "</ul></div></div>";
    }



    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Quotes.aspx?");
    }
}
