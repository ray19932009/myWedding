using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class memberCentre_Store : System.Web.UI.Page
{
    string imgURL = "~/img/upp/";
    FactoryDBDataContext db = new FactoryDBDataContext();
    int id ;
    ProcessLetters p = new ProcessLetters();
    protected void Page_Load(object sender, EventArgs e)
    {
        this.ImageButton1.Attributes["onmouseover"] = "this.src='/img/update2.png';";
        this.ImageButton1.Attributes["onmouseout"] = "this.src='/img/update.png';";

        tMember mb = Session[CDKey.LOGINUSER] as tMember;
        

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
            var Gallery = from g in db.tGallery
                        join gp in db.tGalleryPhoto on g.fIdGallery equals gp.fIdGallery
                        where g.fIdStores == 6
                        select new
                        {
                            fPhoto = gp.fPhoto,
                            fName = g.fName

                        };
            DataList1.DataSource = Gallery;
            DataList1.DataBind();

            var table = from s in db.tStores
                            //join m in db.tMember on s.fIdStores equals m.fIdMember
                        where s.fIdStores == id
                        select s;
            var table2 = from m in db.tMember
                             // join s in db.tStores on s.fIdStores equals m.fIdMember
                         where m.fIdMember == id
                         select m;

            foreach (tStores o in table)
            {
                txtDescription.Text = o.fDescription;
                txtMobilePhone.Text = o.fMobilePhone;
            }

            foreach (tMember o in table2)
            {
                txtAddress.Text = o.fAddress;
                txtEmail.Text = o.fEmail;
                txtPhone.Text = o.fPhone;
                txtStore.Text = o.fName;
                imgPic.ImageUrl = imgURL + o.fPhoto;
                imgPic2.ImageUrl = imgURL + o.fPhoto;
                lblUserName.Text = o.fName;
            }

        }
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
                imgPic.ImageUrl = imgURL + x.fPhoto;
                imgPic2.ImageUrl = imgURL + x.fPhoto;
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



    protected void btnUpDate_Click(object sender, ImageClickEventArgs e)
    {
        tStores x = db.tStores.FirstOrDefault(t => t.fIdStores == id);
        tMember x2 = db.tMember.First(t => t.fIdMember == id);
        if (x2 != null && x != null)
        {
            x2.fAddress = txtAddress.Text;
            x2.fEmail = txtEmail.Text;
            x2.fPhone = txtPhone.Text;
            x2.fName = txtStore.Text;

            x.fDescription = txtDescription.Text;
            x.fMobilePhone = txtMobilePhone.Text;

            db.SubmitChanges();
            Response.Write("<script>alert('更新成功');</script>");

        }
    }
}