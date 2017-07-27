using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MakeUpSecretary : System.Web.UI.Page
{
    public static PagedDataSource pg = new PagedDataSource();

    protected void Page_Load(object sender, EventArgs e)
    {
        Label3.Text = "<li><a href='MakeUpSecretary.aspx?subClass=0' class='btn dark_btn " + (Request["subClass"] == null || Request["subClass"] == "0" ? "selected" : "") + "'>新娘秘書全部</a></li><li><a href = 'MakeUpSecretary.aspx?subClass=8' class='btn dark_btn " + (Request["subClass"] == "8" ? "selected" : "") + "'>整體造型</a></li><li><a href = 'MakeUpSecretary.aspx?subClass=9' class='btn dark_btn " + (Request["subClass"] == "9" ? "selected" : "") + "'>新娘美甲美睫</a></li>";

        if (!IsPostBack)
        {
            if (DropDownList1.SelectedIndex == 0)
            {
                if (Request["subClass"] == null)
                {
                    ViewState["pageindex"] = 0;
                    BindData(0);
                }
                ViewState["pageindex"] = 0;
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
    private void BindData(int subclass)
    {
        //連線資料庫
        SqlConnection conn = new SqlConnection("Data Source=mywedding.cqb8null5yfs.ap-northeast-1.rds.amazonaws.com;Initial Catalog=myWedding;User Id=iiiSouth9402;Password=marcoLeonPower9402");
        conn.Open();

        SqlDataAdapter da = new SqlDataAdapter("SELECT a.fIdGallery,a.fIdStores,a.fName as galleryName,a.fDescription,b.fPhoto,f.fPhoto as memberPhoto,f.fName as memberName From tGallery as a inner join tGalleryPhoto as b on a.fIdGallery = b.fIdGallery inner join tStores as c on a.fIdStores = c.fIdStores inner join tServicesSubClass as e on a.fIdServicesSubClass = e.fIdServicesSubClass inner join tServicesClass as d on d.fIdServicesClass = e.fIdServicesClass inner join tMember as f on f.fIdMember = a.fIdStores where a.fDelete is null and a.fIdPhotoCover = b.fIdPhoto" + (subclass == 0 ? "  and d.fIdServicesClass=3 order by fUploadTime asc" : " and  a.fIdServicesSubClass = " + Request["subClass"] + " order by fUploadTime asc"), conn);

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
        //連線資料庫
        SqlConnection conn = new SqlConnection("Data Source=mywedding.cqb8null5yfs.ap-northeast-1.rds.amazonaws.com;Initial Catalog=myWedding;User Id=iiiSouth9402;Password=marcoLeonPower9402");
        conn.Open();

        SqlDataAdapter da = new SqlDataAdapter("SELECT a.fIdGallery,a.fIdStores,a.fName as galleryName,a.fDescription,b.fPhoto,f.fPhoto as memberPhoto,f.fName as memberName From tGallery as a inner join tGalleryPhoto as b on a.fIdGallery = b.fIdGallery inner join tStores as c on a.fIdStores = c.fIdStores inner join tServicesSubClass as e on a.fIdServicesSubClass = e.fIdServicesSubClass inner join tServicesClass as d on d.fIdServicesClass = e.fIdServicesClass inner join tMember as f on f.fIdMember = a.fIdStores where a.fDelete is null and a.fIdPhotoCover = b.fIdPhoto" + (subclass == 0 ? "  and d.fIdServicesClass=3 order by fUploadTime desc" : " and  a.fIdServicesSubClass = " + Request["subClass"] + " order by fUploadTime desc"), conn);

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
            if (pageindex < pg.PageCount - 1)
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