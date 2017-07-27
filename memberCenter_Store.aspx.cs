using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class 新會員中心廠商 : System.Web.UI.Page
{
    int lkk;
    string imgURL = "~/img/upp/";
    FactoryDBDataContext db = new FactoryDBDataContext();
    public int id;
    ProcessLetters p = new ProcessLetters();
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
            //p.ProcessLetterMsg(member, lblLetter);
            id = mb.fIdMember;

        }
        if (Page.IsPostBack == false)
        {
            //我的方案
          

            //我的作品跟方案
            fludatalist();

            var table3 = from s in db.tStores
                             //join m in db.tMember on s.fIdStores equals m.fIdMember
                         where s.fIdStores == id
                         select s;
            var table2 = from m in db.tMember
                             // join s in db.tStores on s.fIdStores equals m.fIdMember
                         where m.fIdMember == id
                         select m;

            foreach (tStores o in table3)
            {            
                txtDescription.Text = o.fDescription;
                txtMobilePhone.Text = o.fMobilePhone;
                txtLine.Text = o.fLineId;
                if (!string.IsNullOrEmpty(o.fHoliday))
                {
                    if (o.fHoliday.Contains('%'))
                    {
                        char delimiterChars = '%';
                        string[] words = o.fHoliday.Split(delimiterChars);
                        DWHoliday.Text = words[0];
                        txtHoliday.Text = words[1];
                    }else
                    {
                       
                    }
                }
                if (!string.IsNullOrEmpty(o.fOpeningTime))
                {
                    if (o.fOpeningTime.Contains('-'))
                    {
                        char delimiterChars3 = '-';
                        string[] words3 = o.fOpeningTime.Split(delimiterChars3);
                        OpTime1.Text = words3[0];
                        OpTime2.Text = words3[1];
                    }
                    else
                    {

                    }
                }
                
                
            }

            foreach (tMember o in table2)
            {
                if (!string.IsNullOrEmpty(o.fAddress))
                {
                    if (o.fAddress.Contains("^"))
                    {
                        char delimiterChars2 = '^';
                        string[] words2 = o.fAddress.Split(delimiterChars2);
                        DWCity.Text = words2[0];
                        txtAddress.Text = words2[1];
                    }
                    else
                    {
                        txtAddress.Text = o.fAddress;
                    }
                }
                else
                {

                }
                txtEmail.Text = o.fEmail;
                txtPhone.Text = o.fPhone;
                txtStore.Text = o.fName;
                lblUserName.Text = o.fName;
                imgPic.ImageUrl =  o.fPhoto;
                imgPic2.ImageUrl = o.fPhoto;
                //lblUserName.Text = o.fName;
            }
            var disc = (from d in db.tDiscussion
                        where d.fIdMember == id
                        orderby d.fSendTime descending
                        select new
                        {
                            fidtit = d.fIdTitle,
                            ftitle = d.fTitle,
                            ftime = d.fSendTime
                        }).Take(20);
            DLDis.DataSource = disc;
            DLDis.DataBind();
            //前3筆回文

            var discR = (from r in db.tDiscussionReply
                         join d in db.tDiscussion on r.fIdTitle equals d.fIdTitle
                         where r.fIdMember == id
                         orderby r.fSendTime descending
                         select new
                         {
                             fcon = r.fContent,
                             fidtit = d.fIdTitle,
                             ftitle = d.fTitle,
                             ftime = r.fSendTime
                         }).Take(20);
            DLDisR.DataSource = discR;
            DLDisR.DataBind();
            //我的報價
            var anser = (from a in db.tAskPrice
                         join ap in db.tAnswerPrice on a.fIdTitle equals ap.fIdTitle
                         where ap.fIdStore == id
                         orderby ap.fSendTime descending
                         select new
                         {
                             fidtit = a.fIdTitle,
                             ftitle = a.fTitle,
                             ftime = a.fSendTime,
                             fcon = ap.fContent
                         }).Take(20);
            DLAsk.DataSource = anser;
            DLAsk.DataBind();


        }
        tMember loginUser = Session[CDKey.LOGINUSER] as tMember;
        if (!IsPostBack)
        {
            //載入行事曆未接受確認之下拉式選單Items
            var calendarItems = from c in db.tCalendar
                                join s in db.tServices on c.fIdServices equals s.fIdServices
                                where loginUser.fIdMember == c.fIdStores && c.fAccepted == false
                                select new { servicename = s.fName, calendarid = c.fIdCalendar };
            if (calendarItems.Count() > 0)
            {
                DropDownList1.DataSource = calendarItems;
                DropDownList1.DataTextField = "servicename";
                DropDownList1.DataValueField = "calendarid";
                DropDownList1.DataBind();
            }
            DropDownList1.Items.Insert(0, "--請選擇--");
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
                lblMsg.Visible = true;
                lblMsg.Text = "檔案上傳成功！";
                tMember x = db.tMember.First(t => t.fIdMember == id);
                x.fPhoto = "/img/upp/" + photoName;
                db.SubmitChanges();
                imgPic.ImageUrl = x.fPhoto;
                imgPic2.ImageUrl = x.fPhoto;


                 Response.Redirect("memberCenter_Store.aspx?tab=1&success1=1");
            }
            catch
            {
                
            }
        }
        else
        {
            
            Response.Redirect("memberCenter_Store.aspx?tab=1fail2=1");
        }
    }
    private void fludatalist()//作品跟方案
    {
        var myser = from s in db.tServices
                    join sp in db.tServicesPic on s.fIdServices equals sp.fIdServices
                    join gp in db.tGalleryPhoto on sp.fIdPhoto equals gp.fIdPhoto
                    where s.fIdStores == id && s.fDelete == null
                    select new
                    {
                        fPhoto = gp.fPhoto,
                        fName = s.fName,                        
                        fnom =s.fIdServices
                    };
        DLLMyservices.DataSource = myser;
        DLLMyservices.DataBind();


        var Gallery = from g in db.tGallery
                      join gp in db.tGalleryPhoto on g.fIdPhotoCover equals gp.fIdPhoto
                      where g.fIdStores == id && g.fDelete==null
                      select new
                      {
                          fPhoto = gp.fPhoto,
                          fName = g.fName,
                          fid = g.fIdGallery,
                          fPhotoid = g.fIdPhotoCover,
                          fnom = g.fIdGallery

                      };
        DataList1.DataSource = Gallery;
        DataList1.DataBind();
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedIndex == 0)
        {
            return;
        }
        //選到的是月曆id
        string newname = "", servicename = "", date = "", newimg = "", price = "", phone = "";
        int calendarid = Convert.ToInt32(this.DropDownList1.SelectedValue);
        var calendar = from c in db.tCalendar
                       join s in db.tServices on c.fIdServices equals s.fIdServices
                       join m in db.tMember on c.fIdMember equals m.fIdMember
                       where c.fIdCalendar == calendarid
                       select new { newname = m.fName, servicename = s.fName, date = c.fDate, newimg = m.fPhoto, price = s.fMaxMoney, phone = m.fPhone };
        if (calendar.Count() > 0)
        {
            foreach (var m in calendar)
            {
                Label3.Text = "<div class=\"well\" style=\"border-radius:20px;font-family:'微軟正黑體';\">" +
                            "<div class=\"media\">" +
                                "<a class=\"pull-left\">" +
                                "<img class=\"media-object\" style=\"width: 71px; border-radius: 43px;\" src=\"" + m.newimg + "\"/>" +
                                "</a>" +
                                "<div class=\"media-body\">" +
                                    "<h2 class=\"media-heading\" style=\"color:#000000;border-radius:20px;\">" + m.servicename + "<span style='color:red;' class='pull-right'>NT$" + m.price + "</span></h2>" +
                                    "<p class=\"text-left\">" + m.newname + "</p>" +
                                    "<hr/>" +
                                    "<p style=\"font-size:18px;\">該新人選擇此方案您接受嗎？</p><div style='text-align:right;margin-bottom:3px'><a href='#' data-calendarid='" + calendarid + "' class='btn btn-success btn-large colinyesservice'>接受</a> <a href='#' data-calendarid='" + calendarid + "' class='btn btn-large colinsendnowhy'>拒絕</a></div>" +
                                    "<hr/><span class=\"pull-right\">" + (m.phone != null ? ("<a class='btn btn-large btn-info' style='cursor:default;margin:5px;'>電話</a>" + m.phone) : "") +
                                    "<a class='btn btn-large btn-info' style='cursor:default;margin:5px;'>預約時間</a>" + Convert.ToDateTime(m.date).ToString("yyyy-MM-dd") + "</span>" +
                                        "</div>" +
                                "</div>" +
                            "</div>";
            }
        }
    }


    protected void btnUpDate_Click(object sender, EventArgs e)
    {
        tStores x = db.tStores.FirstOrDefault(t => t.fIdStores == id);
        tMember x2 = db.tMember.First(t => t.fIdMember == id);
        if (x2 != null && x != null)
        {
            x2.fAddress = DWCity.SelectedItem.Text +"^"+ txtAddress.Text;
            x2.fEmail = txtEmail.Text;
            x2.fPhone = txtPhone.Text;
            x2.fName = txtStore.Text;


            x.fOpeningTime = OpTime1.SelectedItem.Text + "-" + OpTime2.SelectedItem.Text;
            x.fDescription = txtDescription.Text;
            x.fMobilePhone = txtMobilePhone.Text;
            x.fLineId = txtLine.Text;
            x.fHoliday = DWHoliday.SelectedItem.Text +"%"+ txtHoliday.Text;
            switch (DWCity.SelectedItem.Text)
            {
                case "台北市":
                    x.fIdCity = 1;
                    break;
                case "新北市":
                    x.fIdCity = 2;
                    break;
                case "桃園市":
                    x.fIdCity = 3;
                    break;
                case "新竹市":
                    x.fIdCity = 4;
                    break;
                case "新竹縣":
                    x.fIdCity = 5;
                    break;
                case "苗栗縣":
                    x.fIdCity = 6;
                    break;
                case "基隆市":
                    x.fIdCity = 7;
                    break;
                case "台南市":
                    x.fIdCity = 8;
                    break;
                case "台中市":
                    x.fIdCity = 9;
                    break;
                case "高雄市":
                    x.fIdCity = 10;
                    break;
                case "花蓮縣":
                    x.fIdCity = 11;
                    break;
                case "台東縣":
                    x.fIdCity = 12;
                    break;
                case "南投縣":
                    x.fIdCity = 14;
                    break;
            }

            db.SubmitChanges();
           // lblMsg.Text = "更新資料成功";
           // lblMsg.Visible = true;
            Response.Redirect("memberCenter_Store.aspx?tab=1&success=1");
        }
    }

    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
       // Response.Redirect("memberCenter_Store.aspx?delete=" + (e.Item.FindControl("Label2") as Label).Text);
        if (e.CommandName == "delete")
        {
         
           // Label6.Text = Convert.ToInt32((e.Item.FindControl("Label2") as Label).Text).ToString();
            Session[CDKey.deletegallery] = (e.Item.FindControl("Label2") as Label).Text;
           // Response.Redirect("memberCenter_Store.aspx?delete=" + (e.Item.FindControl("Label2") as Label).Text);

            /*var deletePhoto = from gp in db.tGalleryPhoto
                              where gp.fIdGallery == Convert.ToInt32((e.Item.FindControl("Label2") as Label).Text)
                              select gp;
            var deleteGallery = (from g in db.tGallery
                                 where g.fIdGallery == Convert.ToInt32((e.Item.FindControl("Label2") as Label).Text)
                                 select g).First();
            foreach (tGalleryPhoto od in deletePhoto)
            {
                db.tGalleryPhoto.DeleteOnSubmit(od);
            }
            db.tGallery.DeleteOnSubmit(deleteGallery);
            db.SubmitChanges();
            Response.Redirect("memberCenter_Store.aspx?tab=2");
            Label4.Visible = true;*/

        }
        
    }


    protected void DLLMyservices_ItemCommand(object source, DataListCommandEventArgs e)
    {

       
        if (e.CommandName == "deleteser")
        {
            Session[CDKey.deleteservices] = (e.Item.FindControl("Label2") as Label).Text;
           /* 
             var deletePic = from sp in db.tServicesPic
                               where sp.fIdServices == Convert.ToInt32((e.Item.FindControl("Label2") as Label).Text)
                               select sp;
             var deleteser = (from s in db.tServices
                                  where s.fIdServices == Convert.ToInt32((e.Item.FindControl("Label2") as Label).Text)
                                  select s).First();
             foreach (tServicesPic od in deletePic)
             {
                 db.tServicesPic.DeleteOnSubmit(od);
             }
             db.tServices.DeleteOnSubmit(deleteser);
             db.SubmitChanges();
             Response.Redirect("memberCenter_Store.aspx?tab=3");
             Label5.Visible = true;*/
        }
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        tGallery x = db.tGallery.FirstOrDefault(t => t.fIdGallery == Convert.ToInt32(Session[CDKey.deletegallery].ToString()));
        if (x != null)
        {
            x.fDelete = "True";
        }


            /* var deletePhoto = from gp in db.tGalleryPhoto
                               where gp.fIdGallery == Convert.ToInt32(Session[CDKey.deletegallery].ToString())
                               select gp;
             var deleteGallery = (from g in db.tGallery
                                  where g.fIdGallery == Convert.ToInt32(Session[CDKey.deletegallery].ToString())
                                  select g).First();
             foreach (tGalleryPhoto od in deletePhoto)
             {
                 db.tGalleryPhoto.DeleteOnSubmit(od);
             }
             db.tGallery.DeleteOnSubmit(deleteGallery);*/
             db.SubmitChanges();
            Session.Remove(CDKey.deletegallery);
        Response.Redirect("memberCenter_Store.aspx?delete=2");
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        tServices x = db.tServices.FirstOrDefault(t => t.fIdServices == Convert.ToInt32(Session[CDKey.deleteservices].ToString()));
        if (x != null)
        {
            x.fDelete = "True";
        }



        /*var deletePic = from sp in db.tServicesPic
                        where sp.fIdServices == Convert.ToInt32(Session[CDKey.deleteservices].ToString())
                        select sp;
        var deleteser = (from s in db.tServices
                         where s.fIdServices == Convert.ToInt32(Session[CDKey.deleteservices].ToString())
                         select s).First();
        foreach (tServicesPic od in deletePic)
        {
            db.tServicesPic.DeleteOnSubmit(od);
        }
        db.tServices.DeleteOnSubmit(deleteser);*/
        db.SubmitChanges();
        Session.Remove(CDKey.deleteservices);
        Response.Redirect("memberCenter_Store.aspx?delete1=3");
    }
}