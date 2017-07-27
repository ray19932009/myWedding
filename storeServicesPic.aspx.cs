using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class storeServicesPic : System.Web.UI.Page
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

            var dw = from s in db.tServices
                      join sp in db.tServicesPic on s.fIdServices equals sp.fIdServices
                      where s.fIdStores == id && s.fDelete == null
                     select new
                      {
                          fname1 = s.fName,
                          fvalue1 = sp.fIdServicesPic
                      };
                     

            foreach (var o in dw)
            {
                DropDownList1.DataTextField = "fname1";
                DropDownList1.DataValueField = "fvalue1";
            }
            DropDownList1.DataSource = dw;
            DropDownList1.DataBind();


            var dw2 = from g in db.tGallery
                     where g.fIdStores == id && g.fDelete==null
                     select new
                     {
                         fname = g.fName,
                         fvalue = g.fIdGallery
                     };

            foreach (var o in dw2)
            {
                DropDownList2.DataTextField = "fname";
                DropDownList2.DataValueField = "fvalue";
            }
            DropDownList2.DataSource = dw2;
            DropDownList2.DataBind();




        }
    }

    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "bbb")
        {
            tServicesPic ga = db.tServicesPic.FirstOrDefault(t => t.fIdServicesPic == Convert.ToInt32(Label1.Text));
            if (ga != null)
            {
                ga.fIdPhoto = Convert.ToInt32((e.Item.FindControl("Label2") as Label).Text);
            }
            db.SubmitChanges();
            Label4.Text = "更換封面成功";
        }
    }


    protected void DropDownList2_SelectedIndexChanged1(object sender, EventArgs e)
    {

        var photoCover = from g in db.tGalleryPhoto
                         join gg in db.tGallery on g.fIdGallery equals gg.fIdGallery
                         where g.fIdGallery == Convert.ToInt32(DropDownList2.SelectedItem.Value)
                         select new
                         {
                             fPhotoid = g.fIdPhoto,
                             fphoto = g.fPhoto
                         };
        DataList1.DataSource = photoCover;
        DataList1.DataBind();



    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
       
        Label1.Text = DropDownList1.SelectedItem.Value;

    }
}