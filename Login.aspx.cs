using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (Session[CDKey.LOGINUSER]!=null)
        {
            Response.Redirect("Default.aspx");
  
        }
        lblLoginMsg.Visible = false;
        if (Request.UrlReferrer != null)
        {
            if (!Request.UrlReferrer.ToString().Contains("Login"))
            {
                Session[CDKey.resourceUrl] = Request.UrlReferrer.ToString();
            }
        }
        

        

    }

    

   

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        FactoryDBDataContext db = new FactoryDBDataContext();
        tMember mem = db.tMember.FirstOrDefault(m => m.fAccount == tbAccount.Text && m.fPassword == tbPassword.Text);
        if (mem != null)
        {
            Session[CDKey.LOGINUSER] = mem;
            if (Session[CDKey.resourceUrl] != null)
            {
                Response.Redirect(Session[CDKey.resourceUrl].ToString());
            }
            Response.Redirect("Default.aspx");







        }
        else
        {
            lblLoginMsg.Visible = true;
            lblLoginMsg.Text = "帳號密碼不符";
        }
        
    }
}