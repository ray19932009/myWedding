using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class storeAddServices : System.Web.UI.Page
{
    FactoryDBDataContext db = new FactoryDBDataContext();
     int id;
    int lastser;
    protected void Page_Load(object sender, EventArgs e)
    {
       
        tMember mb = Session[CDKey.LOGINUSER] as tMember;

        if (Session[CDKey.LOGINUSER] == null)
        {

            Response.Redirect("Login.aspx");
        }
        else
        {
            tMember member = (tMember)Session[CDKey.LOGINUSER];
            id = mb.fIdMember;

        }
        if (!IsPostBack)
        {
            var table = from m in db.tMember
                        where m.fIdMember == id
                        select m;
            foreach (tMember o in table)
            {
                lblUserName.Text = o.fName;
                imgPic.ImageUrl = o.fPhoto;

            }



            var tb1 = from s1 in db.tServicesClass
                      select new
                      {
                          fname = s1.fName,
                          fser = s1.fIdServicesClass
                      };
            foreach (var o in tb1)
            {
                Dw1.DataTextField = "fname";
                Dw1.DataValueField = "fser";
            }
            Dw1.DataSource = tb1;
            Dw1.DataBind();


            var tb2 = from s2 in db.tServicesSubClass
                      where s2.fIdServicesClass == Convert.ToInt32(Dw1.SelectedItem.Value)
                      select new
                      {
                          fname = s2.fName,
                          fser = s2.fIdServicesSubClass
                      };
            foreach (var o in tb2)
            {
                Dw2.DataTextField = "fname";
                Dw2.DataValueField = "fser";
            }
            Dw2.DataSource = tb2;
            Dw2.DataBind();
        }
       

    }

    protected void Dw1_SelectedIndexChanged(object sender, EventArgs e)
    {
        var tb2 = from s2 in db.tServicesSubClass
                  where s2.fIdServicesClass == Convert.ToInt32(Dw1.SelectedItem.Value)
                  select new
                  {
                      fname = s2.fName,
                      fser = s2.fIdServicesSubClass
                  };
        foreach (var o in tb2)
        {
            Dw2.DataTextField = "fname";
            Dw2.DataValueField = "fser";
        }
        Dw2.DataSource = tb2;
        Dw2.DataBind();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
       // Textarea.Value.Replace("\r\n", "<br/>");
       // TextBox2.Text = TextBox2.Text.Replace("\r\n", "<br/>");
        var newServices = new tServices
        {
          fIdStores = id,
          fUploadTime=DateTime.Now,
          fIdSubServicesClass = Convert.ToInt32(Dw2.SelectedItem.Value),
          fName=TextBox1.Text,
          fMaxMoney=Convert.ToInt32(tbMax.Text),
          fDescription=TextBox2.Text,
          fContent =Textarea.Value
        };        
        db.tServices.InsertOnSubmit(newServices);
        db.SubmitChanges();

        var last = (from ser in db.tServices
                    where ser.fIdStores == id
                    orderby ser.fIdServices descending
                    select new {
                        la = ser.fIdServices
                    }).Take(1);
        
        foreach(var l in last)
        {
            lastser = l.la;
        }
        var newServicesPic = new tServicesPic
        {
            fIdPhoto = 1,
            fIdServices = lastser
        };
        db.tServicesPic.InsertOnSubmit(newServicesPic);
        db.SubmitChanges();





        TextBox1.Text = "";
        TextBox2.Text = "";
        tbMax.Text = "";
        Textarea.InnerText = "";
        lblMsg.Visible = true;
    }
}