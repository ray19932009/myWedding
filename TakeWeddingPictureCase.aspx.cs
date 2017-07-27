using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class TakeWeddingPicture : System.Web.UI.Page
{
    public static PagedDataSource pg = new PagedDataSource();
    FactoryDBDataContext db = new FactoryDBDataContext();
    public string site = "";
    public bool islogin = false;
    public List<int> star = new List<int>();

    protected void Page_Load(object sender, EventArgs e)
    {
        string site = Request["site"];

        if(Session[CDKey.LOGINUSER] != null)
        {
            islogin = true;

        }

      


        Label3.Text = "<li  ><a href='TakeWeddingPictureCase.aspx?subClass=0' class='btn dark_btn " + (Request["subClass"] == null || Request["subClass"] == "0" ? "selected" : "") + "'>婚紗全部</a></li><li><a href = 'TakeWeddingPictureCase.aspx?subClass=1' class='btn dark_btn " + (Request["subClass"] == "1" ? "selected" : "") + "'>自助婚紗</a></li><li><a href = 'TakeWeddingPictureCase.aspx?subClass=2' class='btn dark_btn " + (Request["subClass"] == "2" ? "selected" : "") + "'>婚紗包套</a></li> <li><a href = 'TakeWeddingPictureCase.aspx?subClass=3'  class='btn dark_btn " + (Request["subClass"] == "3" ? "selected" : "") + "'>海外婚紗</a></li><li><a href = 'TakeWeddingPictureCase.aspx?subClass=4' class='btn dark_btn " + (Request["subClass"] == "4" ? "selected" : "") + "'>特色婚紗</a></li>";

        if (!IsPostBack)
        {
            if (DropDownList1.SelectedIndex == 1)
        {
         
            if (Request["subClass"] == null)
            {
                ViewState["pageindex"] = "0";
                BindData(0);
            }
            ViewState["pageindex"] = "0";
            BindData(Convert.ToInt32(Request["subClass"]));

       
        }
        else  
        {
           
            if (Request["subClass"] == null)
            {
                ViewState["pageindex"] = "0";
                BindData排序(0);
          

            }
            ViewState["pageindex"] = "0";
            BindData排序(Convert.ToInt32(Request["subClass"]));
          

        }

        }

    }

    private void BindData(int subclass)
    {
        selectStar();
        SqlConnection conn = new SqlConnection("Data Source=mywedding.cqb8null5yfs.ap-northeast-1.rds.amazonaws.com;Initial Catalog=myWedding;User Id=iiiSouth9402;Password=marcoLeonPower9402");
        //SqlConnection conn = new SqlConnection("Data Source=LEEYINGCHENG-PC\\SQLEXPRESS;Initial Catalog=myWedding;User Id=sa;Password=as");
        conn.Open();



        SqlDataAdapter da = new SqlDataAdapter("SELECT a.fIdServices,a.fIdStores,c.fIdGallery,c.fPhoto,a.fName,a.fDescription,a.fMaxMoney,a.fMinMoney,d.fPhoto as StorePhoto,d.fName as StoreName FROM tServices AS a inner join tServicesPic as b on a.fIdServices = b.fIdServices inner join tGalleryPhoto as c on c.fIdPhoto = b.fIdPhoto inner join tMember as d on a.fIdStores = d.fIdMember inner join tStores as e on d.fIdMember = e.fIdStores inner join tServicesSubClass as f on a.fIdSubServicesClass = f.fIdServicesSubClass inner join tServicesClass as g on f.fIdServicesClass = g.fIdServicesClass WHERE a.fDelete is null and g.fIdServicesClass = 1" + (subclass == 0 ? " order by fUploadTime asc" : " and  a.fIdSubServicesClass=" + Request["subClass"] + " order by fUploadTime asc"), conn);


        

        DataTable dt = new DataTable();
        da.Fill(dt);
       
        if (dt != null && dt.Rows.Count > 0)
        {
            DataView dv = dt.DefaultView;
            pg.DataSource = dv;

            pg.AllowPaging = true;
            pg.PageSize = 12;
            pg.CurrentPageIndex = int.Parse(ViewState["pageindex"].ToString());

            if (!pg.IsFirstPage)
            {
                lkPre.Enabled = true;
                lkfirst.Enabled = true;
            }
            else
            {
                lkPre.Enabled = false;
                lkfirst.Enabled = false;
            }
            if (!pg.IsLastPage)
            {
                lkNext.Enabled = true;
                lklast.Enabled = true;
            }
            else
            {
                lkNext.Enabled = false;
                lklast.Enabled = false;
            }
            int a = Convert.ToInt16(ViewState["pageindex"]);
            a = a + 1;
            
            Label1.Text = (a).ToString();
            //Label2.Text = (pg.PageCount).ToString();
            DataList1.DataSource = pg;
            DataList1.DataBind();


           
        }
        conn.Close();
    }
    private void selectStar()
    {
       
        SqlConnection conn = new SqlConnection("Data Source=mywedding.cqb8null5yfs.ap-northeast-1.rds.amazonaws.com;Initial Catalog=myWedding;User Id=iiiSouth9402;Password=marcoLeonPower9402");

        conn.Open();

        SqlCommand cmd = new SqlCommand("SELECT a.fIdServices  FROM tLIkeServices as a inner join tServices as b on a.fidServices = b.fIdServices", conn);

        SqlDataReader reader = cmd.ExecuteReader();

        while (reader.Read())
        {
           star.Add(reader.GetInt32(0));
        }


        reader.Close();
        conn.Close();
    

}
    private void BindData排序(int subclass)
    {
        selectStar();
        SqlConnection conn = new SqlConnection("Data Source=mywedding.cqb8null5yfs.ap-northeast-1.rds.amazonaws.com;Initial Catalog=myWedding;User Id=iiiSouth9402;Password=marcoLeonPower9402");
        //SqlConnection conn = new SqlConnection("Data Source=LEEYINGCHENG-PC\\SQLEXPRESS;Initial Catalog=myWedding;User Id=sa;Password=as");
        conn.Open();

        SqlDataAdapter da = new SqlDataAdapter("SELECT a.fIdServices,a.fIdStores,c.fIdGallery,c.fPhoto,a.fName,a.fDescription,a.fMaxMoney,a.fMinMoney,d.fPhoto as StorePhoto,d.fName as StoreName FROM tServices AS a inner join tServicesPic as b on a.fIdServices = b.fIdServices inner join tGalleryPhoto as c on c.fIdPhoto = b.fIdPhoto inner join tMember as d on a.fIdStores = d.fIdMember inner join tStores as e on d.fIdMember = e.fIdStores inner join tServicesSubClass as f on a.fIdSubServicesClass = f.fIdServicesSubClass inner join tServicesClass as g on f.fIdServicesClass = g.fIdServicesClass WHERE a.fDelete is null and g.fIdServicesClass = 1" + (subclass == 0 ? " order by fUploadTime desc" : " and  a.fIdSubServicesClass=" + Request["subClass"] + " order by fUploadTime desc"), conn);

        DataTable dt = new DataTable();
        da.Fill(dt);

        if (dt != null && dt.Rows.Count > 0)
        {
            DataView dv = dt.DefaultView;
            pg.DataSource = dv;

            pg.AllowPaging = true;
            pg.PageSize = 12;
            pg.CurrentPageIndex = int.Parse(ViewState["pageindex"].ToString());

            if (!pg.IsFirstPage)
            {
                lkPre.Enabled = true;
                lkfirst.Enabled = true;
            }
            else
            {
                lkPre.Enabled = false;
                lkfirst.Enabled = false;
            }
            if (!pg.IsLastPage)
            {
                lkNext.Enabled = true;
                lklast.Enabled = true;
            }
            else
            {
                lkNext.Enabled = false;
                lklast.Enabled = false;
            }
            int a = Convert.ToInt16(ViewState["pageindex"]);
            a = a + 1;
            Label1.Text = (a).ToString();
            //Label2.Text = (pg.PageCount).ToString();
            DataList1.DataSource = pg;
            DataList1.DataBind();

            conn.Close();
        }
    }
    public void IndexChanging(object sender, EventArgs e)
    {
         string strcommand = ((LinkButton)sender).CommandArgument.ToString();
        int pageindex = int.Parse(ViewState["pageindex"].ToString());
        if (strcommand == "pre")
        {
            if (pageindex != 0)
            {
                pageindex = pageindex - 1;
            }
            
        }
        else if (strcommand == "next")
        {
            if (pageindex <= pg.PageCount - 1)
            {
                pageindex = pageindex + 1;
            }
            
        }
        else if (strcommand == "first")
        {
            pageindex = 0;
        }
        else if (strcommand == "last")
        {
            pageindex = pg.PageCount - 1;
        }
        ViewState["pageindex"] = pageindex.ToString();
        BindData(Convert.ToInt32(Request["subClass"])); 
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

     

    }

    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {



    }

    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        //SqlConnection conn = new SqlConnection("Data Source=mywedding.cqb8null5yfs.ap-northeast-1.rds.amazonaws.com;Initial Catalog=myWedding;User Id=iiiSouth9402;Password=marcoLeonPower9402");
        //SqlConnection conn = new SqlConnection("Data Source=LEEYINGCHENG-PC\\SQLEXPRESS;Initial Catalog=myWedding;User Id=sa;Password=as");
        //conn.Open();

        //SqlCommand cmd = new SqlCommand("SELECT a.fIdServices as aaa FROM tLIkeServices as a inner join tServices as b on a.fidServices = b.fIdServices", conn);

        //SqlDataReader reader = cmd.ExecuteReader();

        //while (reader.Read())
        //{
        //    if (reader["aaa"] != DBNull.Value)
        //    {
        //        if (Convert.ToInt32((e.Item.FindControl("Label19") as Label).Text) == reader.GetInt32(0))
        //            Response.Write("<script>alert('" + Convert.ToInt32((e.Item.FindControl("Label19") as Label).Text) + "')</script>");
        //        Rating1.CurrentRating = 1;


        //        star = Convert.ToInt32((e.Item.FindControl("Label19") as Label).Text);

        //    }
        //}


        //reader.Close();
        //conn.Close();
    }



    protected void Rating1_Changed(object sender, AjaxControlToolkit.RatingEventArgs e)
    {
        //DataListItem dlltem = (DataListItem)(((Control)sender).NamingContainer);
        //int i = dlltem.ItemIndex;



        //SqlConnection conn = new SqlConnection("Data Source=mywedding.cqb8null5yfs.ap-northeast-1.rds.amazonaws.com;Initial Catalog=myWedding;User Id=iiiSouth9402;Password=marcoLeonPower9402");
        ////SqlConnection conn = new SqlConnection("Data Source=LEEYINGCHENG-PC\\SQLEXPRESS;Initial Catalog=myWedding;User Id=sa;Password=as");
        //conn.Open();

        //if (Rating1.CurrentRating == 0)
        //{
        //    SqlCommand cmd = new SqlCommand("INSERT INTO dbo.tlikeServices (fIdMember,fIdServices,flikeStar) VALUES (@fIdMember,@fIdServices,@flikeStar)", conn);

        //    tMember mb = Session[CDKey.LOGINUSER] as tMember;

        //    cmd.Parameters.AddWithValue("@fIdMember", mb.fIdMember);
        //    cmd.Parameters.AddWithValue("@fIdServices", (DataList1.Items[i].FindControl("Label19") as Label).Text);
        //    cmd.Parameters.AddWithValue("@flikeStar", 1);

        //    cmd.ExecuteNonQuery();


        //    Response.Redirect(Request.Url.ToString());
        //}
        //else
        //{
        //    SqlCommand cmd = new SqlCommand("DELETE FROM dbo.tlikeServices (fIdMember,fIdServices,flikeStar) VALUES (@fIdMember,@fIdServices,@flikeStar)", conn);

        //    tMember mb = Session[CDKey.LOGINUSER] as tMember;

        //    cmd.Parameters.AddWithValue("@fIdMember", mb.fIdMember);
        //    cmd.Parameters.AddWithValue("@fIdServices", (DataList1.Items[i].FindControl("Label19") as Label).Text);
        //    cmd.Parameters.AddWithValue("@flikeStar", 1);

        //    cmd.ExecuteNonQuery();


        //    Response.Redirect(Request.Url.ToString());




        //}
        //conn.Close();
        //Response.Write("<script>alert('" + (DataList1.Items[i].FindControl("Label19") as Label).Text + "')</script>");


    }
}
   