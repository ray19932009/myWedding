using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class storePhotoCover : System.Web.UI.Page
{
    FactoryDBDataContext db = new FactoryDBDataContext();
    public int id;
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
        if (Page.IsPostBack == false)
        {

            var table = from m in db.tMember
                        where m.fIdMember == id
                        select m;
            foreach (tMember o in table)
            {
                lblUserName.Text = o.fName;
                imgPic.ImageUrl = o.fPhoto;

            }


            var dw = from g in db.tGallery
                     where g.fIdStores == id && g.fDelete == null
                     select new
                     {
                         fname = g.fName,
                         fvalue = g.fIdGallery
                     };

            foreach (var o in dw)
            {
                DropDownList1.DataTextField = "fname";
                DropDownList1.DataValueField = "fvalue";
            }
            DropDownList1.DataSource = dw;
            DropDownList1.DataBind();

            


        }
    }

    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "bbb")
        {
            //Label3.Text = (e.Item.FindControl("Label2") as Label).Text;
            tGallery ga = db.tGallery.FirstOrDefault(t => t.fIdGallery == Convert.ToInt32((e.Item.FindControl("Label1") as Label).Text));
            if (ga != null)
            {
                ga.fIdPhotoCover = Convert.ToInt32((e.Item.FindControl("Label2") as Label).Text);
            }
            db.SubmitChanges();
            Label4.Text = "更換封面成功";
        }
    }


    protected void DropDownList1_SelectedIndexChanged1(object sender, EventArgs e)
    {

       var photoCover = from g in db.tGalleryPhoto
                        join gg in db.tGallery on g.fIdGallery equals gg.fIdGallery
                             where g.fIdGallery == Convert.ToInt32(DropDownList1.SelectedItem.Value)
                             select new
                             {
                                 fid = gg.fIdGallery,
                                 fPhotoid = g.fIdPhoto,
                                 fphoto = g.fPhoto
                             };
            DataList1.DataSource = photoCover;
            DataList1.DataBind();



    }
}