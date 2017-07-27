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
    public string site = "";
    public bool islogin = false;
    public List<int> star = new List<int>();
    public string siteId = "";
    public string fid = "";  //storefId
    public string gid = "";  //galleryfId
    public string allsite = ""; //全部地區
    protected void Page_Load(object sender, EventArgs e)
    {
        selectStar();
        if (Session[CDKey.LOGINUSER] != null)
        {
            islogin = true;

        }

        if (Request["siteId"] == null)
        {
            allsite = "liselected";
        }
        string siteId = Request["siteId"];
        int siteId1 = Convert.ToInt32(siteId);


        if (siteId1 > 0)    //利用a標籤fid =12 選擇到選全部
        {
            selectStar();
            select各地區();
        }
        else
        {
            selectStar();
            select地區全部();
        }

    }

    public void select地區全部()
    {
        selectStar();
        string siteId = Request["siteId"];
        var table = from t in db.tServices
                    join a in db.tServicesPic on t.fIdServices equals a.fIdServices
                    join b in db.tGalleryPhoto on a.fIdPhoto equals b.fIdPhoto
                    join c in db.tMember on t.fIdStores equals c.fIdMember
                    join d in db.tStores on t.fIdStores equals d.fIdStores
                    join e in db.tCity on d.fIdCity equals e.fIdCity
                    orderby t.fUploadTime descending
                    where t.fIdSubServicesClass == 10 & t.fDelete == null    //全部的照片

                    select new
                    {
                        f婚宴場地方案封面照 = b.fPhoto,
                        f會員名稱 = c.fName,
                        f金額 = "NT$"+t.fMaxMoney,
                        f大頭照 = c.fPhoto,
                        f方案名稱 = t.fName,
                        f方案描述 = t.fDescription,


                        fIdServices = t.fIdServices,
                        fIdStores = t.fIdStores
                    };

        DataList1.DataSource = table;
        DataList1.DataBind();
    }
    public void select地區全部人氣排序()
    {
        selectStar();
        string siteId = Request["siteId"];
        var table = from t in db.tServices
                    join a in db.tServicesPic on t.fIdServices equals a.fIdServices
                    join b in db.tGalleryPhoto on a.fIdPhoto equals b.fIdPhoto
                    join c in db.tMember on t.fIdStores equals c.fIdMember
                    join d in db.tStores on t.fIdStores equals d.fIdStores
                    join e in db.tCity on d.fIdCity equals e.fIdCity
                    orderby t.fUploadTime ascending
                    where t.fIdSubServicesClass == 10 & t.fDelete == null   //全部的照片
                    select new
                    {
                        f婚宴場地方案封面照 = b.fPhoto,
                        f會員名稱 = c.fName,
                        f金額 = "NT$" + t.fMaxMoney ,
                        f大頭照 = c.fPhoto,
                        f方案名稱 = t.fName,
                        f方案描述 = t.fDescription,


                        fIdServices = t.fIdServices,
                        fIdStores = t.fIdStores
                    };
        
        DataList1.DataSource = table;
        DataList1.DataBind();
    }
    private void selectStar()
    {

        SqlConnection conn = new SqlConnection("Data Source=mywedding.cqb8null5yfs.ap-northeast-1.rds.amazonaws.com;Initial Catalog=myWedding;User Id=iiiSouth9402;Password=marcoLeonPower9402");

        conn.Open();

        SqlCommand cmd = new SqlCommand("SELECT a.fIdServices as aaa  FROM tLIkeServices as a inner join tServices as b on a.fidServices = b.fIdServices", conn);

        SqlDataReader reader = cmd.ExecuteReader();

        while (reader.Read())
        {
            star.Add(reader.GetInt32(0));
        }


        reader.Close();
        conn.Close();




    }
    public void select各地區()
    {
        selectStar();
        string siteId = Request["siteId"];
        var table = from t in db.tServices
                    join a in db.tServicesPic on t.fIdServices equals a.fIdServices
                    join b in db.tGalleryPhoto on a.fIdPhoto equals b.fIdPhoto
                    join c in db.tMember on t.fIdStores equals c.fIdMember
                    join d in db.tStores on t.fIdStores equals d.fIdStores
                    join e in db.tCity on d.fIdCity equals e.fIdCity
                    where t.fIdSubServicesClass == 10 & e.fIdCity == Convert.ToInt32(siteId) & t.fDelete == null
                    orderby t.fUploadTime descending
                    select new
                    {
                        f婚宴場地方案封面照 = b.fPhoto,
                        f會員名稱 = c.fName,
                        f金額 = t.fMaxMoney,
                        f大頭照 = c.fPhoto,
                        f方案名稱 = t.fName,
                        f方案描述 = t.fDescription,

                        fIdServices = t.fIdServices,
                        fIdStores = t.fIdStores
                    };

        


        DataList111.DataSource = table;
        DataList111.DataBind();
    }
    public void select各地區人氣排序()
    {
        selectStar();
        string siteId = Request["siteId"];
        var table = from t in db.tServices
                    join a in db.tServicesPic on t.fIdServices equals a.fIdServices
                    join b in db.tGalleryPhoto on a.fIdPhoto equals b.fIdPhoto
                    join c in db.tMember on t.fIdStores equals c.fIdMember
                    join d in db.tStores on t.fIdStores equals d.fIdStores
                    join e in db.tCity on d.fIdCity equals e.fIdCity
                    where t.fIdSubServicesClass == 10 & e.fIdCity == Convert.ToInt32(siteId) & t.fDelete == null
                    orderby t.fUploadTime ascending
                    select new
                    {
                        f婚宴場地方案封面照 = b.fPhoto,
                        f會員名稱 = c.fName,
                        f金額 = t.fMaxMoney,
                        f大頭照 = c.fPhoto,
                        f方案名稱 = t.fName,
                        f方案描述 = t.fDescription,

                        fIdServices = t.fIdServices,
                        fIdStores = t.fIdStores
                    };

      
     

        DataList111.DataSource = table;
        DataList111.DataBind();
    }




    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string siteId = Request["siteId"];
        int siteId1 = Convert.ToInt32(siteId);
        if (DropDownList1.SelectedIndex == 0)
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
            if (siteId1 > 0)    //利用a標籤fid =12 選擇到選全部
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