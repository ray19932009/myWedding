using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class gallery_1 : System.Web.UI.Page
{
    public static PagedDataSource pg = new PagedDataSource();
    FactoryDBDataContext db = new FactoryDBDataContext();
    public string fid = "";
    public string gid = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        selectDataList_gallery1();
        selectInfo();
        selectdatalist();
        selectTopNavi();
    }
    public void selectDataList_gallery1()
    {
        string fid = Request["fid"];
        string gid = Request["gid"];
        var table = from t in db.tGallery
                    join a in db.tGalleryPhoto on t.fIdGallery equals a.fIdGallery
                    where t.fIdStores == Convert.ToInt32(fid) & t.fIdGallery == Convert.ToInt32(gid)
                    orderby t.fUploadTime descending
                    select new { fPhoto = a.fPhoto,
                                 fName = t.fName,
                                 fDescription = t.fDescription};

        DataList_gallery1.DataSource = table;
        DataList_gallery1.DataBind();
        

    }
    public void selectdatalist()
    {
        string fid = Request["fid"];
        var table = from t in db.tGallery
                    join a in db.tGalleryPhoto on t.fIdGallery equals a.fIdGallery
                    where t.fIdStores == Convert.ToInt32(fid) && t.fIdPhotoCover == a.fIdPhoto
                    orderby t.fUploadTime descending
                    select new
                    {
                        fPhoto = a.fPhoto,
                        fName = t.fName,
                        fDescription = t.fDescription,
                        fIdGallery = t.fIdGallery,
                        fIdStores = t.fIdStores
                    };

        DataList1.DataSource = table;
        DataList1.DataBind();


    }
    public void selectInfo()
    {
        fid = Request["fid"];
        string gid = Request["gid"];
        //SqlConnection conn = new SqlConnection("Data Source=.;Initial Catalog=myWedding;User Id=sa;Password=as");
        SqlConnection conn = new SqlConnection("Data Source=mywedding.cqb8null5yfs.ap-northeast-1.rds.amazonaws.com;Initial Catalog=myWedding;User Id=iiiSouth9402;Password=marcoLeonPower9402");
        conn.Open();

        SqlCommand cmd = new SqlCommand("SELECT a.fName,a.fDescription from tGallery as a inner join tGalleryPhoto as b on (a.fIdGallery = b.fIdGallery) where fIdStores = " + fid + " and " + "b.fIdGallery = "+ gid, conn);

        SqlDataReader reader = cmd.ExecuteReader();

        while (reader.Read())
        {
            lblName.Text = reader.GetString(0);
            lblDescription.Text = reader.GetString(1);
            Label3.Text = reader.GetString(0);
        }
        reader.Close();
        conn.Close();
        conn.Dispose();
    }


    public void selectTopNavi()
    {
        fid = Request["fid"];
        string gid = Request["gid"];
        //SqlConnection conn = new SqlConnection("Data Source=.;Initial Catalog=myWedding;User Id=sa;Password=as");
        SqlConnection conn = new SqlConnection("Data Source=mywedding.cqb8null5yfs.ap-northeast-1.rds.amazonaws.com;Initial Catalog=myWedding;User Id=iiiSouth9402;Password=marcoLeonPower9402");
        conn.Open();

        SqlCommand cmd = new SqlCommand("SELECT fName,fPhoto from tMember where fIdMember = " + fid , conn);

        SqlDataReader reader = cmd.ExecuteReader();

        while (reader.Read())
        {
            lbl_TopNavi.Text = reader.GetString(0);
            img_TopNavi.ImageUrl = reader.GetString(1);
            Label2.Text = reader.GetString(0);
            
        }
        reader.Close();
        conn.Close();
        conn.Dispose();
    }
}