using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;


public partial class WeddingSite : System.Web.UI.Page
{
    FactoryDBDataContext db = new FactoryDBDataContext();
    public string siteId = "";
    public string fid = "";  //storefId
    public string gid = "";  //galleryfId
    public string allsite = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (Request["siteId"] == null)
        {
            allsite = "liselected";
        }
        string siteId = Request["siteId"];
        int siteId1 = Convert.ToInt32(siteId);
     

        if (siteId1 > 0)    //利用a標籤fid =12 選擇到選全部
        {
            
            select各地區();
        }
        else
        {
            select地區全部();
        }
       
    }

    public void select地區全部()
    {
        string siteId = Request["siteId"];
        var table = from t in db.tGallery
                    join b in db.tGalleryPhoto on t.fIdGallery equals b.fIdGallery
                    join c in db.tMember on t.fIdStores equals c.fIdMember
                    join d in db.tStores on t.fIdStores equals d.fIdStores
                    where t.fIdServicesSubClass == 10 & t.fIdPhotoCover == b.fIdPhoto & t.fDelete == null
                    orderby t.fUploadTime descending
                    select new
                    {
                        f作品集照片 = b.fPhoto,
                        f作品集名稱 = t.fName,
                        f大頭照 = c.fPhoto,
                        f作品集描述 = t.fDescription,
                        f廠商名稱= c.fName,
                        fIdgallery = t.fIdGallery,
                        fIdStores = t.fIdStores
                    };

        DataList1.DataSource = table;
        DataList1.DataBind();
    }
    public void select地區全部人氣排序()
    {
        string siteId = Request["siteId"];
        var table = from t in db.tGallery
                    join b in db.tGalleryPhoto on t.fIdGallery equals b.fIdGallery
                    join c in db.tMember on t.fIdStores equals c.fIdMember
                    join d in db.tStores on t.fIdStores equals d.fIdStores               
                    where t.fIdServicesSubClass == 10 & t.fIdPhotoCover == b.fIdPhoto & t.fDelete == null
                    orderby t.fUploadTime ascending
                    select new
                    {
                        f作品集照片 = b.fPhoto,
                        f作品集名稱 = t.fName,
                        f大頭照 = c.fPhoto,
                        f作品集描述 = t.fDescription,
                        f廠商名稱 = c.fName,
                        fIdgallery = t.fIdGallery,
                        fIdStores = t.fIdStores


                    };

        DataList1.DataSource = table;
        DataList1.DataBind();
    }
    public void select各地區()
    {
        string siteId = Request["siteId"];
        var table = from t in db.tGallery
                    join a in db.tGalleryPhoto on t.fIdGallery equals a.fIdGallery
                    join b in db.tStores on t.fIdStores equals b.fIdStores
                    join c in db.tCity on b.fIdCity equals c.fIdCity
                    join d in db.tMember on t.fIdStores equals d.fIdMember
                    where t.fIdServicesSubClass == 10 & c.fIdCity == Convert.ToInt32(siteId) & t.fIdPhotoCover == a.fIdPhoto & t.fDelete == null
                    orderby t.fUploadTime descending
                    select new
                    {
                        f作品集照片 = a.fPhoto,
                        f作品集名稱 = t.fName,
                        f大頭照 = d.fPhoto,
                        f作品集描述 = t.fDescription,
                        f廠商名稱= d.fName,
                        fIdgallery = t.fIdGallery,
                        fIdStores = t.fIdStores
                    };

        DataList111.DataSource = table;
        DataList111.DataBind();
    }
    public void select各地區人氣排序()
    {
        string siteId = Request["siteId"];
        var table = from t in db.tGallery
                    join a in db.tGalleryPhoto on t.fIdGallery equals a.fIdGallery
                    join b in db.tStores on t.fIdStores equals b.fIdStores
                    join c in db.tCity on b.fIdCity equals c.fIdCity
                    join d in db.tMember on t.fIdStores equals d.fIdMember                   
                    where t.fIdServicesSubClass == 10 & c.fIdCity == Convert.ToInt32(siteId) & t.fIdPhotoCover == a.fIdPhoto & t.fDelete == null
                    orderby t.fUploadTime ascending
                    select new
                    {
                        f作品集照片 = a.fPhoto,
                        f作品集名稱 = t.fName,
                        f大頭照 = d.fPhoto,
                        f作品集描述 = t.fDescription,
                        f廠商名稱 = d.fName,
                        fIdgallery = t.fIdGallery,
                        fIdStores = t.fIdStores
                    };
        
        DataList111.DataSource = table;
        DataList111.DataBind();
    }



    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string siteId = Request["siteId"];
        int siteId1 = Convert.ToInt32(siteId);
        if (DropDownList1.SelectedIndex == 0 )
        {
            if (siteId1 > 0)    //利用a標籤fid =12 選擇到選全部
            {
               
                select各地區();
            }
            else
            {
                select地區全部();
            }

        }
        else
        {
            if (siteId1 > 0 )    //利用a標籤fid =12 選擇到選全部
            {
               
                select各地區人氣排序();
            }
            else
            {
                select地區全部人氣排序();
            }
        }
 
    }


    
}