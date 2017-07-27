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
            var dw = from g in db.tServicesSubClass
                     select 
                     new
                     {
                         fname = g.fName,
                         fser = g.fIdServicesSubClass
                     };
                     
            foreach(var o in dw)
             {
                DWServices.DataTextField = "fname";
                DWServices.DataValueField = "fser";
             }
           
            DWServices.DataSource = dw;
            DWServices.DataBind();


           

        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
       
        var newGallery = new tGallery
        {
            fIdStores=id,
            fName=txtname.Text,
            fDescription=txtDescription.Text,
            fUploadTime=DateTime.Now,
            fIdServicesSubClass=Convert.ToInt32(DWServices.SelectedItem.Value),
            fIdPhotoCover=1
        };
        db.tGallery.InsertOnSubmit(newGallery);
        db.SubmitChanges();
        Button2.Visible = true;
        Label4.Visible = true;
     
        
        
    }
    
}