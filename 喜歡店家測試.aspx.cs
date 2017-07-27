using System;
using System.Collections;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class 模板測試 : System.Web.UI.Page
{
    FactoryDBDataContext db = new FactoryDBDataContext();
    int id;
    string strURL = "~/img/upp";
    string strimg = "";
    string fPhoto;
    protected void Page_Load(object sender, EventArgs e)
    {
        tMember mb = Session[CDKey.LOGINUSER] as tMember;



        //  string s = Session[CDKey.LOGINUSER].ToString();
        if (Session[CDKey.LOGINUSER] == null)
        {
            Response.Write("<script>alert('沒抓到SESSION');</script>");
            Response.Redirect("Login.aspx");
        }
        else
        {
            id = mb.fIdMember;
            Response.Write("<script>alert(" + id + ");</script>");
            if (mb.fIdentity == 0)
            {
                HyperLink Hyper1 = (HyperLink)Master.FindControl("HyperLink1");
                Hyper1.Text = mb.fAccount;
                Hyper1.NavigateUrl = "~/memberCenter_New.aspx";
            }
            else
            {
                HyperLink Hyper1 = (HyperLink)Master.FindControl("HyperLink1");
                Hyper1.Text = mb.fAccount;
                Hyper1.NavigateUrl = "~/memberCenter_Store.aspx";
            }

            HyperLink Hyper2 = (HyperLink)Master.FindControl("HyperLink2");
            Hyper2.Text = "登出";
            Hyper2.NavigateUrl = "~/Logout.aspx";
        }
      
        id = mb.fIdMember;

        var likeStores = from c in db.tCollection
                         join m in db.tMember on c.fIdStores equals m.fIdMember
                         where c.fIdMember == id
                         select new
                         {
                             fName = m.fName,
                             fPhoto = m.fPhoto
                         };

        DLLikeStores.DataSource = likeStores;
        DLLikeStores.DataBind();







        // string i = DLLikeStores.Items[0].ToString();
        // Label2.Text = i;
        // Label RegionIDLabel = DLLikeStores.Items[].FindControl("lblLikeStores") as Label;
        //RegionIDLabel.Text = "AAA";






        //try foreach 裡面哪一層有你的物件 才可以find


        /*  var likeStore = from a in db.tCollection
                          join m in db.tMember on a.fIdMember equals m.fIdMember
                          where a.fIdMember == id
                          select m;
          */
    }


    protected void DLLikeStores_ItemDataBound1(object sender, DataListItemEventArgs e)
    {
        /*
            var likeStores = from c in db.tCollection
                    join se in db.tServices on c.fIdStores equals se.fIdStores
                    join m in db.tMember on c.fIdStores equals m.fIdMember
                    join s in db.tServicesPic on se.fIdServices equals s.fIdServices
                    join g in db.tGalleryPhoto on s.fIdPhoto equals g.fIdPhoto
                    where c.fIdMember == id
                    select new
                    {
                        fName = m.fName,
                        fPhoto = g.fPhoto
                    };

        string[] aa = { };
        int i = 0;
        foreach (var o in table)
        {
           
                Array.Resize<string>(ref aa, i + 1);

                aa[i] = Convert.ToString(o.name);
                i++;
            
        }
        int q;
        for (q =0 ; q < aa.Length; q++)
        {
            Label lbSN = e.Item.FindControl("lblLikeStores") as Label;
            lbSN.Text +=  aa[q];
            
                
        }
/*
        foreach (var o in table)
        {
            
                Label lbSN = e.Item.FindControl("lblLikeStores") as Label;
                lbSN.Text += o.name+"<Br/>";
            
            
            
        }*/
    }
}