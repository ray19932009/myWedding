using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WeddingREC : System.Web.UI.Page
{
    public static PagedDataSource pg = new PagedDataSource();
    FactoryDBDataContext db = new FactoryDBDataContext();
    public string site = "";
    public bool islogin = false;
    public List<int> star = new List<int>();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session[CDKey.LOGINUSER] != null)
        {
            islogin = true;

        }



        Label3.Text = "<li><a href='WeddingRECCase.aspx?subClass=0' class='btn dark_btn " + (Request["subClass"] == null || Request["subClass"] == "0" ? "selected" : "") + "'>婚禮全部</a></li><li><a href = 'WeddingRECCase.aspx?subClass=5' class='btn dark_btn " + (Request["subClass"] == "5" ? "selected" : "") + "'>婚禮攝影</a></li><li><a href = 'WeddingRECCase.aspx?subClass=6' class='btn dark_btn " + (Request["subClass"] == "6" ? "selected" : "") + "'>婚禮錄影</a></li> <li><a href = 'WeddingRECCase.aspx?subClass=7'  class='btn dark_btn " + (Request["subClass"] == "7" ? "selected" : "") + "'>婚禮MV</a></li>";


        if (!IsPostBack)
        {
            if (DropDownList1.SelectedIndex == 0)
        {
            if (Request["subClass"] == null)
            {
                ViewState["pageindex"] = "0";
                BindData(0);
            }
            ViewState["pageindex"] = "0";
            BindData(Convert.ToInt32(Request["subClass"]));
        }
        else if (DropDownList1.SelectedIndex == 1)
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

    private void BindData(int subclass)
    {
        selectStar();
        //連線資料庫
        SqlConnection conn = new SqlConnection("Data Source=mywedding.cqb8null5yfs.ap-northeast-1.rds.amazonaws.com;Initial Catalog=myWedding;User Id=iiiSouth9402;Password=marcoLeonPower9402");
        //SqlConnection conn = new SqlConnection("Data Source=.;Initial Catalog=myWedding;User Id=sa;Password=as");
        conn.Open();

        //SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM tGallery AS a INNER JOIN  tGalleryPhoto AS b ON a.fIdPhotoCover = b.fIdPhoto INNER JOIN tServicesSubClass as c  ON c.fIdServicesSubClass = a.fIdServicesSubClass inner Join tServicesClass as d ON d.fIdServicesClass = c.fIdServicesClass WHERE c.fIdServicesClass = 2" + (subclass == 0 ? "" : " and  a.fIdServicesSubClass=" + Request["subClass"]), conn);

        SqlDataAdapter da = new SqlDataAdapter("SELECT a.fIdServices,a.fIdStores,c.fIdGallery,c.fPhoto,a.fName,a.fDescription,a.fMaxMoney,a.fMinMoney,d.fPhoto as StorePhoto,d.fName as StoreName FROM tServices AS a inner join tServicesPic as b on a.fIdServices = b.fIdServices inner join tGalleryPhoto as c on c.fIdPhoto = b.fIdPhoto inner join tMember as d on a.fIdStores = d.fIdMember inner join tStores as e on d.fIdMember = e.fIdStores inner join tServicesSubClass as f on a.fIdSubServicesClass = f.fIdServicesSubClass inner join tServicesClass as g on f.fIdServicesClass = g.fIdServicesClass WHERE a.fDelete is null and g.fIdServicesClass = 2" + (subclass == 0 ? " order by fUploadTime asc" : " and  a.fIdSubServicesClass=" + Request["subClass"] + " order by fUploadTime asc"), conn);
         


        DataTable dt = new DataTable();
        da.Fill(dt);
        

        //判斷是否有資料
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
            DataList5.DataSource = pg;
            DataList5.DataBind();
            conn.Dispose();
            conn.Close();
           
        }
    }
    private void BindData排序(int subclass)
    {
        selectStar();
        //連線資料庫
        SqlConnection conn = new SqlConnection("Data Source=mywedding.cqb8null5yfs.ap-northeast-1.rds.amazonaws.com;Initial Catalog=myWedding;User Id=iiiSouth9402;Password=marcoLeonPower9402");
        //SqlConnection conn = new SqlConnection("Data Source=.;Initial Catalog=myWedding;User Id=sa;Password=as");
        conn.Open();

        //SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM tGallery AS a INNER JOIN  tGalleryPhoto AS b ON a.fIdPhotoCover = b.fIdPhoto INNER JOIN tServicesSubClass as c  ON c.fIdServicesSubClass = a.fIdServicesSubClass inner Join tServicesClass as d ON d.fIdServicesClass = c.fIdServicesClass WHERE c.fIdServicesClass = 2" + (subclass == 0 ? "" : " and  a.fIdServicesSubClass=" + Request["subClass"]), conn);

        SqlDataAdapter da = new SqlDataAdapter("SELECT a.fIdServices,a.fIdStores,c.fIdGallery,c.fPhoto,a.fName,a.fDescription,a.fMaxMoney,a.fMinMoney,d.fPhoto as StorePhoto,d.fName as StoreName FROM tServices AS a inner join tServicesPic as b on a.fIdServices = b.fIdServices inner join tGalleryPhoto as c on c.fIdPhoto = b.fIdPhoto inner join tMember as d on a.fIdStores = d.fIdMember inner join tStores as e on d.fIdMember = e.fIdStores inner join tServicesSubClass as f on a.fIdSubServicesClass = f.fIdServicesSubClass inner join tServicesClass as g on f.fIdServicesClass = g.fIdServicesClass WHERE a.fDelete is null and g.fIdServicesClass = 2" + (subclass == 0 ? " order by fUploadTime desc" : " and  a.fIdSubServicesClass=" + Request["subClass"] + " order by fUploadTime desc"), conn);



        DataTable dt = new DataTable();
        da.Fill(dt);


        //判斷是否有資料
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
            DataList5.DataSource = pg;
            DataList5.DataBind();
            conn.Dispose();
            conn.Close();

        }
    }

    //頁數變更時
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
        if (DropDownList1.SelectedIndex == 0)
        {
            if (Request["subClass"] == null)
            {
                ViewState["pageindex"] = "0";
                BindData(0);
            }
            ViewState["pageindex"] = "0";
            BindData(Convert.ToInt32(Request["subClass"]));
        }
        else if (DropDownList1.SelectedIndex == 1)
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