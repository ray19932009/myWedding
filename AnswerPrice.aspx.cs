using System;
using System.Activities.Expressions;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class About : System.Web.UI.Page
{
    
    FactoryDBDataContext db = new FactoryDBDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack){
            Label4.Visible = false;
            var table = from a in db.tServices
                       where a.fIdStores == Convert.ToInt32(Request["stid"])
                       select new { a.fContent, a.fName, a.fIdServices };

            DropDownList1.DataSource = table;
            
            DropDownList1.DataTextField = "fName";
            DropDownList1.DataValueField = "fContent";
            
          
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0,new ListItem("請選擇方案", "請選擇方案"));

        }
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

        var table = from a in db.tServices
                    where a.fIdStores == Convert.ToInt32(Request["stid"])
                    select a;
        int count = 0;
        string lal = ((sender as DropDownList).SelectedValue).Replace("<br />","\r\n");
        //Response.Write("<script>alert('" + lal + "')</script>");
        TextBox1.Text= lal;
        
        if (table.Count() > 0)
        {
            foreach (tServices s in table)
            {
            if ((sender as DropDownList).SelectedIndex != 0) { 
                if (count == ((sender as DropDownList).SelectedIndex-1))
                {
                       
                    Label1.Text = "<input type=\"hidden\" id=\"samserviceid\" name=\"samserviceid\" runat=\"server\" value=\"" + s.fIdServices + "\" />";
                        var table1 = from a in db.tServices
                                     where a.fIdServices == s.fIdServices
                                     select a;
                        foreach (tServices x in table)
                        {
                            Label2.Text = (x.fMaxMoney).ToString();
                        }
                            // Label1.Text = s.fIdServices.ToString();
                            break;
                }
                }
                else
                {
                    Label1.Text = "<input type=\"hidden\" id=\"samserviceid\" name=\"samserviceid\" runat=\"server\" value=\"0\" />";
                    Label2.Text = "";
                }

                count++;
            }
        }
       




    }



    protected void Button1_Click1(object sender, EventArgs e)
    {

    
        if (DropDownList1.SelectedIndex!=0) { 

         tMember mb = Session[CDKey.LOGINUSER] as tMember;
          tAnswerPrice a = new tAnswerPrice();
          a.fIdStore = Convert.ToInt32(Request["stid"]);
          a.fIdTitle = Convert.ToInt32(Request["id"]);
          a.fSendTime = DateTime.Now;
          a.fIdServices = Convert.ToInt32(Request.Form["samserviceid"]);
          a.fContent = TextBox1.Text;
          db.tAnswerPrice.InsertOnSubmit(a);
          db.SubmitChanges();
          Response.Redirect("AskPrice.aspx");
        }
        else
        {
            Label4.Visible = true;
            Label4.Text = "請先選擇方案";

        }
    }
}