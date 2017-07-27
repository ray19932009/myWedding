using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

public partial class WeddingOneDragon : System.Web.UI.Page
{
    ProcessServiceClassClick p = new ProcessServiceClassClick();    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session[CDKey.LOGINUSER] == null)
        {
            Response.Redirect("Login.aspx");
        }
            Label9.Text = "<div data-identity='"+ (Session[CDKey.LOGINUSER] as tMember).fIdentity + "' style='display:none'></div>";
        

        Label[] label = { Label5, Label6, Label7, Label8 };
        tServices[] services = new tServices[4];
        if (Session[CDKey.ServiceChoose]!=null)
        services = (tServices[])Session[CDKey.ServiceChoose];
        p.processMaual(Label1);
        p.processServiceSubClassTitle(Label2);
        p.processPage(Label3);
        p.processCity(Label4);
        for(int i = 0; i < 4; i++)
        {
            if (services[i] != null)
            {
                label[i].Text = "<a style = 'margin-right:3px;' href='#' class='btn btn-danger' data-delclass='" + (i+1) + "'>刪除</a>" + services[i].fName + " , NT$ " + services[i].fMinMoney + " ~ " + services[i].fMaxMoney;
            } else
            {
                label[i].Text = "無選擇";
            }
        }
        
    }
}