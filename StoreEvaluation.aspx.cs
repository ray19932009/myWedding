using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StoreEvaluation : System.Web.UI.Page
{
    string imgURL = "/img/upp/";
    FactoryDBDataContext db = new FactoryDBDataContext();
    ProcessLetters p = new ProcessLetters();
    int id;
    protected void Page_Load(object sender, EventArgs e)
    {

        tMember mb = Session[CDKey.LOGINUSER] as tMember;

        if (Session[CDKey.LOGINUSER] == null)
        {
            Response.Write("<script>alert('沒抓到SESSION');</script>");
            Response.Redirect("Login.aspx");
        }
        else
        {
            tMember member = (tMember)Session[CDKey.LOGINUSER];

            id = mb.fIdMember;

        }

        if (Page.IsPostBack == false)
        {
            var storeAndServices = from m in db.tMember
                                   join s in db.tServices on m.fIdMember equals s.fIdStores
                                   where s.fIdServices == Convert.ToInt32(Request["Sid"])
                                   select new
                                   {
                                       fName = m.fName,
                                       fPhoto = m.fPhoto,
                                       fService = s.fName
                                   };
            foreach (var o in storeAndServices)
            {
                lblUserName.Text = o.fName;
                lblservicesName.Text = o.fService;
                imgPic.ImageUrl = o.fPhoto;
            };



        }
    }

    protected void stare1_Click(object sender, ImageClickEventArgs e)
    {
        stare1.ImageUrl = "/img/star.png";
        stare2.ImageUrl = "/img/starempty1.png";
        stare3.ImageUrl = "/img/starempty1.png";
        stare4.ImageUrl = "/img/starempty1.png";
        stare5.ImageUrl = "/img/starempty1.png";
        lblstare.Text = "1";
        Label6.Visible = true;

    }
    protected void stare2_Click(object sender, ImageClickEventArgs e)
    {
        stare1.ImageUrl = "/img/star.png";
        stare2.ImageUrl = "/img/star.png";
        stare3.ImageUrl = "/img/starempty1.png";
        stare4.ImageUrl = "/img/starempty1.png";
        stare5.ImageUrl = "/img/starempty1.png";
        lblstare.Text = "2";
        Label6.Visible = true;
    }


    protected void stare3_Click(object sender, ImageClickEventArgs e)
    {
        stare1.ImageUrl = "/img/star.png";
        stare2.ImageUrl = "/img/star.png";
        stare3.ImageUrl = "/img/star.png";
        stare4.ImageUrl = "/img/starempty1.png";
        stare5.ImageUrl = "/img/starempty1.png";
        lblstare.Text = "3";
        Label6.Visible = true;
    }


    protected void stare4_Click(object sender, ImageClickEventArgs e)
    {
        stare1.ImageUrl = "/img/star.png";
        stare2.ImageUrl = "/img/star.png";
        stare3.ImageUrl = "/img/star.png";
        stare4.ImageUrl = "/img/star.png";
        stare5.ImageUrl = "/img/starempty1.png";
        lblstare.Text = "4";
        Label6.Visible = true;
    }

    protected void stare5_Click(object sender, ImageClickEventArgs e)
    {
        stare1.ImageUrl = "/img/star.png";
        stare2.ImageUrl = "/img/star.png";
        stare3.ImageUrl = "/img/star.png";
        stare4.ImageUrl = "/img/star.png";
        stare5.ImageUrl = "/img/star.png";
        lblstare.Text = "5";
        Label6.Visible = true;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (lblstare.Text == "點擊星星評價")
        {
            Response.Write("<script>alert('請選擇評價分數');</script>");
        }
        else if(Convert.ToInt32(Request["Sid"])>0 && (!string.IsNullOrEmpty(Request["Sid"])))
        {
            tCalendar x = db.tCalendar.First(t => t.fIdServices == Convert.ToInt32(Request["Sid"]));
            x.fOK = "True";
            //更新
            db.SubmitChanges();

            var newEva = new tEvaluation
            {
                fidMember = id,
                fidServices = Convert.ToInt32(Request["Sid"]),
                fStar = Convert.ToInt32(lblstare.Text),
                fContent = tbContent.Text,                
            };
            db.tEvaluation.InsertOnSubmit(newEva);
            db.SubmitChanges();
            Response.Redirect("memberCenter_New.aspx?tab=5&suc=1");

            // Response.Write("<script language=javascript>alert('評價成功!')</script>");
            // Response.Write("<script language=javascript>window.location.href='memberCenter_New.aspx'</script>");

        }
        else
        {
            Response.Write("<script language=javascript>alert('評價失敗!')</script>");
        }
    }
    
}
    

    
 
