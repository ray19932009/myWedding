using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMessage.Visible = false;
    }

    

    protected void btnRegister_Click1(object sender, EventArgs e)
    {
        lblMessage.Visible = false;
    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        tMember member = new tMember();
        tStores s = new tStores();
        FactoryDBDataContext db = new FactoryDBDataContext();

        member.fIdentity = Convert.ToInt32(rdoList.SelectedValue);
        member.fAccount = Request["account"];
        member.fPassword = Request.Form["pwd"];
        member.fName = Request.Form["name"];
        member.fPhoto = "/img/head.png";

        

        tMember mem = db.tMember.FirstOrDefault(m => m.fAccount == Request["account"]);
        if (mem != null)
        {
            lblMessage.Visible = true;
            lblMessage.Text = "註冊帳號重複";
        }else if(Request["pwd"] != Request["pwd_dou"])
        {
            lblMessage.Visible = true;
            lblMessage.Text = "兩次密碼輸入須一致";
        }
        else
        {
            db.tMember.InsertOnSubmit(member);
            db.SubmitChanges();
            tMember loginmember = db.tMember.FirstOrDefault(m => m.fAccount == Request["account"]);
            Session[CDKey.LOGINUSER] = loginmember;
            if (Convert.ToInt32(rdoList.SelectedValue) == 1)
            {
                s.fIdStores = loginmember.fIdMember;
                db.tStores.InsertOnSubmit(s);
                db.SubmitChanges();
            }
            Response.Redirect("Default.aspx");
        }    

    
       
        
        
    }

}