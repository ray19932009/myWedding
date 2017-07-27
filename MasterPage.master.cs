using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    FactoryDBDataContext db = new FactoryDBDataContext();
    ProcessChatMsg p = new ProcessChatMsg();
    string badge = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        Label2.Text = "<a class='btn loginusertype' href=\"Register.aspx\">免費註冊</a>";
        Label3.Text = "<a class='btn loginusertype' href=\"Login.aspx\">登入</a>";
        tMember mb = Session[CDKey.LOGINUSER] as tMember;
        if (mb != null)
        {
            if ((Session[CDKey.LOGINUSER] as tMember).fName != null)
            {
                
            }
            else
            {

            }
            string badgenum=(from t in db.tLetter
             where t.fIdReceiver == (Session[CDKey.LOGINUSER] as tMember).fIdMember && t.fIsRead == false
             select t).Count().ToString();
            if (badgenum == "0")
            {
                badgenum = "";
            }
            badge = "<span class='badge'>"+ badgenum + "</span>";
            if (mb.fIdentity == 0)
            {                
                Label2.Text= "<a class='btn loginusertype' href=\"memberCenter_New.aspx\">" + mb.fName + badge + "</a>";
            }
            else
            {
                Label2.Text = "<a class='btn loginusertype' href=\"memberCenter_Store.aspx\">" + mb.fName + badge + "</a>";
            }            

            Label3.Text = "<a class='btn loginusertype' href=\"Logout.aspx\">登出</a>";

            lblId.Text = "<input type='hidden' id='loginid' value='" + (Session[CDKey.LOGINUSER] as tMember).fIdMember + "' runat='server'/><input type='hidden' id='identity' value='" + (Session[CDKey.LOGINUSER] as tMember).fIdentity + "' runat='server'/>";
        }
        
    }
    

    protected void Button1_Click(object sender, EventArgs e)
    {        
        HtmlInputControl another = (HtmlInputControl)Page.Master.FindControl("anotherid");
        int anotherid = Convert.ToInt32(another.Value);
        HtmlInputControl more = (HtmlInputControl)Page.Master.FindControl("more");
        int moreid = Convert.ToInt32(more.Value);

        Label1.Text = p.ProcessRefreshChatBox(anotherid, (Session[CDKey.LOGINUSER] as tMember).fIdMember, moreid);
    }
    protected void Timer1_Tick(object sender, EventArgs e)
    {
        if (Session[CDKey.LOGINUSER] != null)
        {
            Button1_Click(sender, e);            
        }
    }
}
