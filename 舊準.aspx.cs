using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class memberCentre_New : System.Web.UI.Page
{
    
    FactoryDBDataContext db = new FactoryDBDataContext();
    string imgURL = "/img/upp/";
    ProcessLetters p = new ProcessLetters();
    int id;
    protected void Page_Load(object sender, EventArgs e)
    {
        inPageLoad();
    }

    protected void btnUpDate_Click(object sender, EventArgs e)
    {
        tMember x = db.tMember.First(t => t.fIdMember == id);
        x.fAddress = txtAddress.Text;
        x.fEmail = txtEmail.Text;
        x.fPhone = txtPhone.Text;
        x.fName = txtName.Text;
        //更新
        db.SubmitChanges();
        Response.Write("<script>alert('更新成功');</script>");
    }
    protected void picUpload_Click(object sender, EventArgs e)
    {
        Boolean fileOk = false;
        String fileExtension = System.IO.Path.GetExtension(picUpload.FileName).ToLower();
        //指定檔路徑，pic是專案下的一個資料夾；～表示當前網頁所在的資料夾
        String path = Server.MapPath("~/img/upp/");//物理檔路徑

        //檔上傳控制項中如果已經包含檔
        if (picUpload.HasFile)
        {

            //得到檔的尾碼


            //允許檔的尾碼
            String[] allowedExtensions = { ".gif", ".png", ".jpeg", ".jpg", ".bmp" };

            //看包含的檔是否是被允許的檔的尾碼
            for (int i = 0; i < allowedExtensions.Length; i++)
            {
                if (fileExtension == allowedExtensions[i])
                {
                    fileOk = true;
                }
            }
        }
        if (fileOk)
        {
            try
            { //檔另存在伺服器的指定目錄下
                string photoName = Guid.NewGuid().ToString() + fileExtension;
                picUpload.PostedFile.SaveAs(path + photoName);
                Response.Write("<script>alert('檔上傳成功！');</script>");
                tMember x = db.tMember.First(t => t.fIdMember == id);
                x.fPhoto = photoName;
                db.SubmitChanges();
               
                imgPic2.ImageUrl = imgURL + x.fPhoto;
                imgPic.ImageUrl = imgURL + x.fPhoto;
            }
            catch
            {
                Response.Write("<script>alert('檔上傳失敗！');</script>");
            }
        }
        else
        {
            Response.Write("<script>alert('只能上傳gif,png,jpeg,jpg,bmp圖像檔！');</script>");
        }
    }

    public void inPageLoad()
    {
        lblSession.Visible = false;
        this.ImageButton1.Attributes["onmouseover"] = "this.src='/img/update2.png';";
        this.ImageButton1.Attributes["onmouseout"] = "this.src='/img/update.png';";

        tMember mb = Session[CDKey.LOGINUSER] as tMember;


        //      string s = Session[CDKey.LOGINUSER].ToString();
        if (Session[CDKey.LOGINUSER] == null)
        {
            Response.Write("<script>alert('沒抓到SESSION');</script>");
            Response.Redirect("Login.aspx");
        }
        else
        {
            tMember member = (tMember)Session[CDKey.LOGINUSER];
            p.ProcessLetterMsg(member, lblLetter);

            id = mb.fIdMember;
            lblSession.Text = id.ToString();
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


        if (Page.IsPostBack == false)
        {
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

            var linqlikeServices = from l in db.tLIkeServices
                                   join m in db.tMember on l.fidStores equals m.fIdMember
                                   join se in db.tServices on l.fidServices equals se.fIdServices
                                   join s in db.tServicesPic on l.fidServices equals s.fIdServices
                                   join g in db.tGalleryPhoto on s.fIdPhoto equals g.fIdPhoto
                                   where l.fidMember == id
                                   select new
                                   {
                                       fName = se.fName,
                                       fPhoto = g.fPhoto
                                   };
            DLLikeServices.DataSource = linqlikeServices;
            DLLikeServices.DataBind();

            var likeStoreCount = from c in db.tCollection
                                 where c.fIdMember == id
                                 select c.fIdCollectionStores;
            int countstore = likeStoreCount.Count();
            if (countstore == 0)
            {
                lblLikestore.Text = "尚未加入喜歡的店家";
            }
            else
            {
                lblLikestore.Text = "您有" + countstore + "個喜歡的店家";
            }
            var likeServicesCount = from l in db.tLIkeServices
                                    where l.fidMember == id
                                    select l.fidLIkeServices;
            int countLikeServices = likeServicesCount.Count();
            if (countLikeServices == 0)
            {
                lblLikeServices.Text = "尚未有收藏的服務";
            }
            else
            {
                lblLikeServices.Text = "您有" + countLikeServices + "個收藏的服務";
            }
            var table = from m in db.tMember
                        where m.fIdMember == id
                        select m;
            foreach (tMember o in table)
            {
                txtName.Text = o.fName;
                txtPhone.Text = o.fPhone;
                txtAddress.Text = o.fAddress;
                txtEmail.Text = o.fEmail;
                lblUserName.Text = o.fName;

                imgPic2.ImageUrl = imgURL + o.fPhoto;
                imgPic.ImageUrl = imgURL + o.fPhoto;



            }
        }
    }
}