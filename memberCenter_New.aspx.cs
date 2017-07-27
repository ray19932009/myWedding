using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class 新會員中心準新人 : System.Web.UI.Page
{
    FactoryDBDataContext db = new FactoryDBDataContext();
    string imgURL = "~/img/upp/";
    ProcessLetters p = new ProcessLetters();
    public int id ;

    protected void Page_Load(object sender, EventArgs e)
    {

        inPageLoad();
    
        tMember loginUser = Session[CDKey.LOGINUSER] as tMember;

        if (!IsPostBack)
        {
            //載入行事曆未接受確認之下拉式選單Items
            var calendarItems = from c in db.tCalendar
                                join s in db.tServices on c.fIdServices equals s.fIdServices
                                where loginUser.fIdMember == c.fIdMember && c.fAccepted == false
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
    
    protected void btnUpDate_Click(object sender, EventArgs e)
    {
        tMember x = db.tMember.First(t => t.fIdMember == id);
        x.fAddress = txtAddress.Text;
        x.fEmail = txtEmail.Text;
        x.fPhone = txtPhone.Text;
        x.fName = txtName.Text;
        //更新
        db.SubmitChanges();
        lblMsg.Text = "更新資料成功";
        lblMsg.Visible = true;
        Response.Redirect("memberCenter_New.aspx?tab=1&success=1");
    }
    protected void picUpload_Click(object sender, EventArgs e)
    {
        Boolean fileOk = false;
        String fileExtension = System.IO.Path.GetExtension(picUpload.FileName).ToLower();
        //指定檔路徑，pic是專案下的一個資料夾；～表示當前網頁所在的資料夾
        String path = Server.MapPath("/img/upp/");//物理檔路徑

       // lblMsg.Text = "fileExtension.ToString()";
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

                tMember x = db.tMember.First(t => t.fIdMember == id);
                x.fPhoto = imgURL+photoName;
                db.SubmitChanges();

                imgPic2.ImageUrl =  x.fPhoto;
                imgPic.ImageUrl =x.fPhoto;
               
                Response.Redirect("memberCenter_New.aspx?tab=1&success=1");
            }
            catch
            {
                

            }
        }
        else
        {
           
           Response.Redirect("memberCenter_New.aspx?tab=1&fail2=1");
        }
    }
    

    public void inPageLoad()
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
            //抓取服務進度 
            var inServices = from c in db.tCalendar
                             join s in db.tServices on c.fIdServices equals s.fIdServices
                             where c.fIdMember == id && c.fDate > DateTime.Now.Date && c.fAccepted.Equals("True")
                             select new
                             {
                                 finName = s.fName,
                                 finDate = c.fDate.Value.Month.ToString() + "月" + c.fDate.Value.Day.ToString() + "日"
                             };
            DLNotYetTime.DataSource = inServices;
            DLNotYetTime.DataBind();

            var in2Services = from c in db.tCalendar
                              join s in db.tServices on c.fIdServices equals s.fIdServices
                              where c.fIdMember == id && c.fDate == DateTime.Now.Date && c.fAccepted.Equals("True")
                              select new
                              {
                                  finName = s.fName,
                                  finDate = c.fDate.Value.Month.ToString() + "月" + c.fDate.Value.Day.ToString() + "日"
                              };
            DllSameTime.DataSource = in2Services;
            DllSameTime.DataBind();

            var in3Services = from c in db.tCalendar
                              join s in db.tServices on c.fIdServices equals s.fIdServices
                              where c.fIdMember == id  && c.fDate < DateTime.Now.Date && c.fAccepted.Equals("True") && c.fOK==null
                              select new
                              {
                                  finName = s.fName,
                                  finDate = c.fDate.Value.Month.ToString() + "月" + c.fDate.Value.Day.ToString() + "日",
                                  fidSer = s.fIdServices
                              };
            DllOverTime.DataSource = in3Services;
            DllOverTime.DataBind();

            var in4Services = from c in db.tCalendar
                              join s in db.tServices on c.fIdServices equals s.fIdServices
                              join e in db.tEvaluation on s.fIdServices equals e.fidServices
                              where c.fIdMember == id && e.fidMember==id && c.fDate < DateTime.Now.Date && e.fStar != null && c.fAccepted.Equals("True")
                              select new
                              {
                                  finName = s.fName,
                                  finDate = c.fDate.Value.Month.ToString() + "月" + c.fDate.Value.Day.ToString() + "日",
                                  fidStar = e.fStar
                              };
            DataList1.DataSource = in4Services;
            DataList1.DataBind();

            var in5Services = from c in db.tCalendar
                              join s in db.tServices on c.fIdServices equals s.fIdServices                            
                              where c.fIdMember == id && c.fAccepted.Equals("False")
                               select new
                               {
                                  finName = s.fName,
                                  finDate = c.fDate.Value.Month.ToString() + "月" + c.fDate.Value.Day.ToString() + "日"
                              };
            DLLnotAccepted.DataSource = in5Services;
            DLLnotAccepted.DataBind();

            //抓取喜歡的店家
            var likeStores = from c in db.tCollection
                             join m in db.tMember on c.fIdStores equals m.fIdMember
                             where c.fIdMember == id
                             select new
                             {
                                 flikeStoreName = m.fName,
                                 flikeStorePhoto = m.fPhoto,
                                 fStore = c.fIdStores 
                             };

            DLLikeStores.DataSource = likeStores;
            DLLikeStores.DataBind();
            //抓取收藏的服務
          /*  var linqlikeServices = from l in db.tLIkeServices
                                   join m in db.tMember on l.fidStores equals m.fIdMember
                                   join se in db.tServices on l.fidServices equals se.fIdServices
                                   join s in db.tServicesPic on l.fidServices equals s.fIdServices
                                   join g in db.tGalleryPhoto on s.fIdPhoto equals g.fIdPhoto
                                   where l.fidMember == id
                                   select new
                                   {
                                       fStore=l.fidStores,
                                       fServices=l.fidServices,
                                       fLikeServiceName = se.fName,
                                       fLikeServicePhoto = g.fPhoto
                                   };*/


            var qqq = from l in db.tLIkeServices
                      join se in db.tServices on l.fidServices equals se.fIdServices
                      join s in db.tServicesPic on l.fidServices equals s.fIdServices
                      join g in db.tGalleryPhoto on s.fIdPhoto equals g.fIdPhoto
                      join st in db.tMember on se.fIdStores equals st.fIdMember
                      where l.fidMember == id
                      select new
                      {
                          fStore = st.fIdMember,
                          fServices = l.fidServices,
                          fLikeServiceName = se.fName,
                          fLikeServicePhoto = g.fPhoto
                      };



            DLLikeServices.DataSource = qqq;
            DLLikeServices.DataBind();
            //喜歡店家數量
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
                lblLikestore.Text = "您有 " + countstore + " 個喜歡的店家";
            }
            //收藏服務數量
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
                lblLikeServices.Text = "您有 " + countLikeServices + " 個收藏的服務";
            }
            //顯示行程數量
            var cale = from c in db.tCalendar
                       where c.fIdMember == id && c.fDate > DateTime.Now.Date && c.fAccepted.Equals("True")
                       select new
                       {
                           fcount = c.fIdCalendar
                       };
            int caleCount = cale.Count();
            if (caleCount == 0)
            {
                lblNew.Text = "尚無未開始行程";
            }
            else
            {
                lblNew.Text = "您有 " + caleCount + " 個未開始行程";
            }

            //顯示基本資料
            var table = from m in db.tMember
                        where m.fIdMember == id
                        select m;
            foreach (tMember o in table)
            {
                txtName.Text = o.fName;
                txtPhone.Text = o.fPhone;
                txtAddress.Text = o.fAddress;
                txtEmail.Text = o.fEmail;

                imgPic2.ImageUrl = o.fPhoto;
                imgPic.ImageUrl = o.fPhoto;
                lblUserName.Text = "準新人:"+o.fName;
            }
            //前3筆發文討論
            var disc = (from d in db.tDiscussion
                       where d.fIdMember == id
                       orderby d.fSendTime descending
                       select  new
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
                         select new {
                             fcon = r.fContent,
                             fidtit = d.fIdTitle,
                             ftitle = d.fTitle,
                             ftime = r.fSendTime
                         }).Take(20);
            DLDisR.DataSource = discR;
            DLDisR.DataBind();
            //我的詢價
            var Askp = (from a in db.tAskPrice
                       where a.fIdMember == id
                       orderby a.fSendTime descending
                       select new
                       {
                           fidtit = a.fIdTitle,
                           ftitle = a.fTitle,
                           ftime = a.fSendTime
                       }).Take(20);
            DLAskP.DataSource = Askp;
            DLAskP.DataBind();

            

        }

    }


    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {//選到的是月曆id
        string storename = "", servicename = "", date = "", servicecontent = "", storeimg = "", price = "", storeid = "", LineId = "", phone = "";
        int calendarid = Convert.ToInt32(this.DropDownList1.SelectedValue);
        var calendar = from c in db.tCalendar
                       join s in db.tServices on c.fIdServices equals s.fIdServices
                       join m in db.tMember on c.fIdStores equals m.fIdMember
                       join n in db.tStores on m.fIdMember equals n.fIdStores
                       where c.fIdCalendar == calendarid
                       select new { storename = m.fName, servicename = s.fName, date = c.fDate, servicecontent = s.fContent, storeimg = m.fPhoto, price = s.fMaxMoney, storeid = c.fIdStores, LineId = n.fLineId, phone = m.fPhone };
        if (calendar.Count() > 0)
        {
            foreach (var m in calendar)
            {
                Label2.Text = "<div class=\"well\" style=\"border-radius:20px;font-family:'微軟正黑體';\">" +
                            "<div class=\"media\">" +
                                "<a class=\"pull-left\" href=\"StoreInfo.aspx?fid=" + m.storeid + "\">" +
                                "<img class=\"media-object\" style=\"width: 71px; border-radius: 43px;\" src=\"" + m.storeimg + "\"/>" +
                                "</a>" +
                                "<div class=\"media-body\">" +
                                    "<h2 class=\"media-heading\" style=\"color:#000000;border-radius:20px;\">" + m.servicename + "<span style='color:red;' class='pull-right'>NT$" + m.price + "</span></h2>" +
                                    "<p class=\"text-left\">" + m.storename + "</p>" +
                                    "<hr/><div style='overflow: scroll;height:300px;overflow-x: hidden;'>" +
                                    "<p style=\"font-size:18px;\">" + (m.servicecontent).Replace("\r\n","<br/>") + "</p>" +
                                    "</div><hr/>" +
                                    "<span class=\"pull-right\">" + (m.LineId != null && m.phone != null ? ("<a class='btn btn-large btn-info' style='cursor:default;margin:5px;'>LineID</a>" + m.LineId + "<a class='btn btn-large btn-info' style='cursor:default;margin:5px;'>電話</a>" + m.phone +
                                    "<br/>") : "") + "<a class='btn btn-large btn-info' style='cursor:default;margin:5px;'>預約時間</a>" + Convert.ToDateTime(m.date).ToString("yyyy-MM-dd") + "</span>" +
                                        "</div>" +
                                "</div>" +
                            "</div>";
            }
        }

    }

}