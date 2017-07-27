using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Letter : System.Web.UI.Page
{
    ProcessLetters p = new ProcessLetters();
    protected void Page_Load(object sender, EventArgs e)
    {
        tMember mb = Session[CDKey.LOGINUSER] as tMember;
        if (mb == null)
            Response.Redirect("Login.aspx");
        HyperLink Hyper1 = (HyperLink)Master.FindControl("HyperLink1");
        Hyper1.Text = mb.fAccount;
        Hyper1.NavigateUrl = "~/memberCenter_New.aspx";

        HyperLink Hyper2 = (HyperLink)Master.FindControl("HyperLink2");
        Hyper2.Text = "登出";
        Hyper2.NavigateUrl = "~/Register.aspx";

        if (Session[CDKey.LOGINUSER] != null)
        {
            tMember member = (tMember)Session[CDKey.LOGINUSER];
            p.ProcessLetterMsg(member, Label1);
        }
        
    }
}