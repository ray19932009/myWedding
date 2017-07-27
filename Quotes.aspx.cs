using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

public partial class Quotes : System.Web.UI.Page
{
    FactoryDBDataContext db = new FactoryDBDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["date"] != null) {
            Label1.Text = "<input type=\"text\"  id=\"date\" name=\"date\" class=\"datepicker\" style=\"width:50%;height:30%; font-size:24px;\" value='"+Request["date"]+"' />";
        (Master.FindControl("ContentPlaceHolder1").FindControl("servies") as HtmlSelect).Value = Request["picker"];
      
        }
        else
        {
            Label1.Text = "<input type=\"text\"  id=\"date\" name=\"date\" class=\"datepicker\" style=\"width:50%;height:30%; font-size:24px;\"  />";
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        tMember mb = Session[CDKey.LOGINUSER] as tMember;

        tAskPrice a = new tAskPrice();
        a.fContent = "需求地點:" + ((Master.FindControl("ContentPlaceHolder1").FindControl("space") as HtmlSelect).Value == "0" ?"不拘": (Master.FindControl("ContentPlaceHolder1").FindControl("space") as HtmlSelect).Value) + "<br/>" + Request.Form["descri"].Replace("\r\n", "<br/>");
        a.fIdMember = mb.fIdMember;
        a.fTitle = "找" + Request.Form["date"] + (Master.FindControl("ContentPlaceHolder1").FindControl("servies") as HtmlSelect).Value;
        a.fWantDay = Convert.ToDateTime(Request.Form["date"]);
        a.fSendTime = DateTime.Now;
        db.tAskPrice.InsertOnSubmit(a);
        db.SubmitChanges();
      
        Response.Redirect("AskPrice.aspx");
        

    }
}