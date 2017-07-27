using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class colinToBeDateBox : System.Web.UI.UserControl
{    

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            for (int i = 1; i <= 200; i++)
            {

                DropDownList1.Items.Add((1900+i).ToString());
                if (i < 13)
                    DropDownList2.Items.Add(i.ToString());
            }
            if (Request.QueryString["year"] == null || Request.QueryString["month"] == null)
            {
                DropDownList1.Text = DateTime.Now.ToString("yyyy");
                DropDownList2.Text = DateTime.Now.Month.ToString();
            }
            else
            {
                DropDownList1.Text = Request.QueryString["year"];
                DropDownList2.Text = Request.QueryString["month"];
            }
            
            
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("WeddingTobe.aspx?year="+ DropDownList1.Text + "&month="+ DropDownList2.Text);
    }
}