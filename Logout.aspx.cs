using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Logout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session.Abandon();
        /*HyperLink Hyper1 = (HyperLink)Master.FindControl("HyperLink1");
        Hyper1.Text = "免費註冊";
        Hyper1.NavigateUrl = "~/Register.aspx";
        ///////////////////
        HyperLink Hyper2 = (HyperLink)Master.FindControl("HyperLink2");
        Hyper2.Text = "登入";
        Hyper2.NavigateUrl = "~/Login.aspx";*/
        Response.Redirect("Default.aspx");
    }
}