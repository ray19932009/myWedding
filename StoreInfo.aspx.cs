using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StoreInfo : System.Web.UI.Page
{
    public static PagedDataSource pg = new PagedDataSource();
    FactoryDBDataContext db = new FactoryDBDataContext();
    public string fid="";
    public string islogin = "display:none;";
    public int like;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["fid"] != null)
        {
            fid = Request["fid"];
        }
        
        if (Session[CDKey.LOGINUSER] != null)
        {

            islogin = "display:block;float:right;";
            selectlike();
        }
        
        selectInfo();
        selectStar();
        selectStarNum();
        selectdatalist1();
        selectdatalist2();

        //Label10.Text = "<li><a href='TakeWeddingPicture.aspx?subClass=0' class='btn dark_btn " + (Request["subClass"] == null || Request["subClass"] == "0" ? "selected" : "") + "'>婚紗全部</a></li><li><a href = 'TakeWeddingPicture.aspx?subClass=1' class='btn dark_btn " + (Request["subClass"] == "1" ? "selected" : "") + "'>自助婚紗</a></li><li><a href = 'TakeWeddingPicture.aspx?subClass=2' class='btn dark_btn " + (Request["subClass"] == "2" ? "selected" : "") + "'>婚紗包套</a></li> <li><a href = 'TakeWeddingPicture.aspx?subClass=3'  class='btn dark_btn " + (Request["subClass"] == "3" ? "selected" : "") + "'>海外婚紗</a></li><li><a href = 'TakeWeddingPicture.aspx?subClass=4' class='btn dark_btn " + (Request["subClass"] == "4" ? "selected" : "") + "'>特色婚紗</a></li>";

    }
    private void selectlike()
    {
        fid = Request["fid"];
        SqlConnection conn = new SqlConnection("Data Source=mywedding.cqb8null5yfs.ap-northeast-1.rds.amazonaws.com;Initial Catalog=myWedding;User Id=iiiSouth9402;Password=marcoLeonPower9402");

        conn.Open();

        SqlCommand cmd = new SqlCommand("SELECT a.fIdStores FROM tCollection as a inner join tMember as b on a.fIdStores = b.fIdMember where a.fidMember =" + (Session[CDKey.LOGINUSER] as tMember).fIdMember + " and a.fIdStores =" +fid, conn);


        SqlDataReader reader = cmd.ExecuteReader();
        
        while (reader.Read() )
        {
            
            like = reader.GetInt32(0);
        }
        //Response.Write("<script>alert('" + like+ islogin + "')</script>");

        //Label10.Text = fid;

        reader.Close();
        conn.Close();

    }
    public void selectInfo()
    {
        
        fid = Request["fid"];
        //SqlConnection conn = new SqlConnection("Data Source=.;Initial Catalog=myWedding;User Id=sa;Password=as");

        SqlConnection conn = new SqlConnection("Data Source=mywedding.cqb8null5yfs.ap-northeast-1.rds.amazonaws.com;Initial Catalog=myWedding;User Id=iiiSouth9402;Password=marcoLeonPower9402");
        conn.Open();

        SqlCommand cmd = new SqlCommand("SELECT a.fName,b.fDescription,a.fEmail,a.fAddress,b.fLineId,a.fPhoto from tMember as a inner join tStores as b on (a.fIdMember = b.fIdStores) where fIdStores =" + fid, conn);

        SqlDataReader reader = cmd.ExecuteReader();

        while (reader.Read())
        {
            Image1.ImageUrl = reader.GetString(5);
            
            Label2.Text = reader.GetString(1);
            Label1.Text = reader.GetString(0);
            Label4.Text = reader.GetString(3);
            Label6.Text = reader.GetString(4);
            Label8.Text = reader.GetString(2);
        }
        reader.Close();
        conn.Close();
        conn.Dispose();
    }

    public void selectStar()
    {
        
        string fid = Request["fid"];
        //SqlConnection conn = new SqlConnection("Data Source=.;Initial Catalog=myWedding;User Id=sa;Password=as");
        SqlConnection conn = new SqlConnection("Data Source=mywedding.cqb8null5yfs.ap-northeast-1.rds.amazonaws.com;Initial Catalog=myWedding;User Id=iiiSouth9402;Password=marcoLeonPower9402");
        conn.Open();

        SqlCommand cmd = new SqlCommand("select (sum(fStar)/COUNT(*)) as aaa from tEvaluation as a inner join tServices as b on(a.fidServices = b.fIdServices) inner join tStores as c on(c.fIdStores = b.fIdStores) where c.fidStores = " + fid, conn);

        SqlDataReader reader = cmd.ExecuteReader();

        while (reader.Read())
        {
           if(reader["aaa"] != DBNull.Value)
            {
                Rating1.CurrentRating = reader.GetInt32(0);

            }


        }

        reader.Close();
        conn.Close();
        conn.Dispose();
    }
    public void selectStarNum()
    {
       
        string fid = Request["fid"];
        //SqlConnection conn = new SqlConnection("Data Source=.;Initial Catalog=myWedding;User Id=sa;Password=as");
        SqlConnection conn = new SqlConnection("Data Source=mywedding.cqb8null5yfs.ap-northeast-1.rds.amazonaws.com;Initial Catalog=myWedding;User Id=iiiSouth9402;Password=marcoLeonPower9402");
        conn.Open();

        SqlCommand cmd = new SqlCommand("select COUNT(*) from tEvaluation as a inner join tServices as b on(a.fidServices = b.fIdServices) inner join tStores as c on(c.fIdStores = b.fIdStores) where c.fidStores =" + fid, conn);

        SqlDataReader reader = cmd.ExecuteReader();


        while (reader.Read())
        {
            Label9.Text = "(共有" + reader.GetInt32(0).ToString() + "人評價)";
        }



        reader.Close();
        conn.Close();
        conn.Dispose();
    }
    public void selectdatalist1()
    {
        string fid = Request["fid"];
        var table = from t in db.tGallery
                    join a in db.tGalleryPhoto on t.fIdGallery equals a.fIdGallery
                    
                    join c in db.tMember on t.fIdStores equals c.fIdMember
                    where t.fIdStores == Convert.ToInt32(fid) && t.fIdPhotoCover == a.fIdPhoto
                    orderby t.fUploadTime descending
                    
                    select new { fPhoto = a.fPhoto,
                                 fName = t.fName,
                                 fDescription = t.fDescription,
                                 fIdGallery = t.fIdGallery,
                                memberName = c.fName,
                        memberPhoto =c.fPhoto,
                        fIdStores = t.fIdStores

                    };
 

        DataList1.DataSource = table;
        DataList1.DataBind();

    }
    public void selectdatalist2()
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

        DataList2.DataSource = table;
        DataList2.DataBind();

    }




}