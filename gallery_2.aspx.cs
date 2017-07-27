using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class gallery_2 : System.Web.UI.Page
{
    public static PagedDataSource pg = new PagedDataSource();
    FactoryDBDataContext db = new FactoryDBDataContext();
    public string fid = "";
    public string sid = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        selectInfo_case();
        selectDataList_case_gallery();
        selectdatalist_morecase();
        naviTopImg();
    }

    public void selectInfo_case()
    {
        fid = Request["fid"];
        sid = Request["sid"];
        //SqlConnection conn = new SqlConnection("Data Source=.;Initial Catalog=myWedding;User Id=sa;Password=as");
        SqlConnection conn = new SqlConnection("Data Source=mywedding.cqb8null5yfs.ap-northeast-1.rds.amazonaws.com;Initial Catalog=myWedding;User Id=iiiSouth9402;Password=marcoLeonPower9402");
        conn.Open();

        SqlCommand cmd = new SqlCommand("SELECT fName,fMaxMoney,fContent from tServices where fIdStores ="+fid+ " and " + "fIdServices ="+sid, conn);

        SqlDataReader reader = cmd.ExecuteReader();

        while (reader.Read())
        {
            lblName.Text = reader.GetString(0);
            lblMax.Text = "NT$ "+reader.GetInt32(1).ToString();
            lblContent.Text = (reader.GetString(2)).Replace("\r\n","<br/>");
            lbl_Menu_third.Text = reader.GetString(0);


        }
        reader.Close();
        conn.Close();
        conn.Dispose();
    }
    public void naviTopImg()
    {
        fid = Request["fid"];
        sid = Request["sid"];
        //SqlConnection conn = new SqlConnection("Data Source=.;Initial Catalog=myWedding;User Id=sa;Password=as");
        SqlConnection conn = new SqlConnection("Data Source=mywedding.cqb8null5yfs.ap-northeast-1.rds.amazonaws.com;Initial Catalog=myWedding;User Id=iiiSouth9402;Password=marcoLeonPower9402");
        conn.Open();

        SqlCommand cmd = new SqlCommand("SELECT fPhoto,fName from tMember where fIdMember =" + fid , conn);

        SqlDataReader reader = cmd.ExecuteReader();

        while (reader.Read())
        {
            img_TopNavi.ImageUrl = reader.GetString(0);
            lbl_TopNavi.Text = reader.GetString(1);
            lbl_Menu_second.Text = reader.GetString(1);
        }
        reader.Close();
        conn.Close();
        conn.Dispose();
    }

    public void selectDataList_case_gallery()
    {
        fid = Request["fid"];
        sid = Request["sid"];
        var table  = from t in db.tServices
                                join a in db.tServicesPic on t.fIdServices equals a.fIdServices
                                join b in db.tGalleryPhoto on a.fIdPhoto equals b.fIdPhoto
                                join c in db.tMember on t.fIdStores equals c.fIdMember
                                join d in db.tStores on t.fIdStores equals d.fIdStores     
                                where t.fIdStores == Convert.ToInt32(fid) & t.fIdServices == Convert.ToInt32(sid)
                                orderby t.fUploadTime descending
                    select new
                    {
                        fPhoto = b.fPhoto

                    };
        DataList_case_gallery.DataSource = table.Take(5);
        DataList_case_gallery.DataBind();

    }

    public void selectdatalist_morecase()
    {
        string fid = Request["fid"];
        var table = from t in db.tServices
                    join a in db.tServicesPic on t.fIdServices equals a.fIdServices
                    join b in db.tGalleryPhoto on a.fIdPhoto equals b.fIdPhoto
                    join c in db.tMember on t.fIdStores equals c.fIdMember
                    join d in db.tStores on t.fIdStores equals d.fIdStores
                    where t.fIdStores == Convert.ToInt32(fid)
                    orderby t.fUploadTime descending
                    select new
                    {
                        fPhoto = b.fPhoto,
                        fName = t.fName,
                        fDescription = t.fDescription,
                        fContent = t.fContent,
                        fMaxMoney = t.fMaxMoney,
                        fMinMoney = t.fMinMoney,
                        StorePhoto = c.fPhoto,
                        StoreName = c.fName,
                        fPopularity = d.fPopularity,
                        fIdServices = t.fIdServices,
                        fIdStores = t.fIdStores
                    };

        DataList_Morecase.DataSource = table;
        DataList_Morecase.DataBind();

    }
}