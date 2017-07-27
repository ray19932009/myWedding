using System;
using System.Linq;
using System.Web;

public partial class storeAddServices : System.Web.UI.Page
{
    FactoryDBDataContext db = new FactoryDBDataContext();
    int id = 6;
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
            var dw = from g in db.tGallery
                     where g.fIdStores == id && g.fDelete == null
                     select new
                     {
                         fname = g.fName,
                         fvalue = g.fIdGallery
                     };
            foreach (var o in dw)
            {
                DWPhoto.DataTextField = "fname";
                DWPhoto.DataValueField = "fvalue";
            }
            DWPhoto.DataSource = dw;
            DWPhoto.DataBind();

        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        int selser = Convert.ToInt32(DWPhoto.SelectedItem.Value);



        //--註解：網站上的目錄路徑。所以不寫磁碟名稱（不寫 “實體”路徑）。
        //--           上傳後的存檔目錄，請依照您的環境作修改。
        String saveDir = "/img/up2/";
        //-- 或是寫成  String saveDir= "\\[Book]FileUpload\\Uploads\\";
        String appPath = Request.PhysicalApplicationPath;
        String fileExtension = System.IO.Path.GetExtension(picUpload.FileName).ToLower();
        //===========================================
        //== Ony .NET 4.5有這個新的 AllowMultiPle屬性
        //===========================================
        Boolean fileOk = false;
        //String fileExtension = System.IO.Path.GetExtension(picUpload.FileName).ToLower();
        //指定檔路徑，pic是專案下的一個資料夾；～表示當前網頁所在的資料夾
        String path = Server.MapPath("/img/up2/");//物理檔路徑

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
            if (picUpload.PostedFile.ContentLength <= 150000000)
            {
                try
                { //檔另存在伺服器的指定目錄下

                    String savePath;
                    foreach (HttpPostedFile postedFile in picUpload.PostedFiles)
                    {
                        string photoName = Guid.NewGuid().ToString() + fileExtension;
                        // fileName = postedFile.FileName;

                        // –完成檔案上傳的動作。
                        savePath = appPath + saveDir + photoName;
                        postedFile.SaveAs(savePath);

                        var newphoto = new tGalleryPhoto
                        {
                            fIdGallery = Convert.ToInt32(DWPhoto.SelectedItem.Value),
                            fPhoto = "/img/up2/" + photoName
                        };
                        db.tGalleryPhoto.InsertOnSubmit(newphoto);
                        db.SubmitChanges();
                    }
                    Label4.Visible = true;
                    Label4.Text = "上傳成功";
                }
                catch
                {
                    Label4.Visible = true;
                    Label4.Text = "上傳失敗";
                    //Response.Write("<script>alert('檔上傳失敗！');</script>");
                }
            }
            else
            {
                Label4.Text = "上傳檔案超過150M！";
            }
        }
        else
        {
            Label4.Visible = true;
            Label4.Text = "只能上傳gif,png,jpeg,jpg,bmp圖像檔！";
            // Response.Write("<script>alert('只能上傳gif,png,jpeg,jpg,bmp圖像檔！');</script>");

        }
        //上傳後顯示上傳圖片
        var photo = from gp in db.tGalleryPhoto
                    where gp.fIdGallery == selser
                    select new
                    {
                        fphoto = gp.fPhoto
                    };
        DataList1.DataSource = photo;
        DataList1.DataBind();

    }


}


