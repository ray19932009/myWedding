using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class TakeWeddingPicture : System.Web.UI.Page
{
    public static PagedDataSource pg = new PagedDataSource();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ViewState["pageindex"] = "0";
            BindData();
        }
    }
    private void BindData()
    {
        SqlConnection conn = new SqlConnection("Data Source=.;Initial Catalog=mydata;User Id=sa;Password=1234");
        conn.Open();
        SqlDataAdapter da = new SqlDataAdapter("Select Item_ID,Item_Name From Item_Detail", conn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt != null && dt.Rows.Count > 0)
        {
            DataView dv = dt.DefaultView;
            pg.DataSource = dv;

            pg.AllowPaging = true;
            pg.PageSize = 3;
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
            Label2.Text = (pg.PageCount).ToString();
            DataList1.DataSource = pg;
            DataList1.DataBind();
        }
    }
    public void IndexChanging(object sender, EventArgs e)
    {
        string strcommand = ((LinkButton)sender).CommandArgument.ToString();
        int pageindex = int.Parse(ViewState["pageindex"].ToString());
        if (strcommand == "pre")
        {
            pageindex = pageindex - 1;
        }
        else if (strcommand == "next")
        {
            pageindex = pageindex + 1;
        }
        else if (strcommand == "first")
        {
            pageindex = 0;
        }
        else if (strcommand == "last")
        {
            pageindex = pg.PageCount - 1;
        }
        ViewState["pageindex"] = pageindex;
        BindData();
    }

    //FactoryDBDataContext db = new FactoryDBDataContext();
    //var table = from s in db.tGallery
    //            from t in db.tGalleryPhoto 

    //            select  s;
    //foreach(tGallery s  in table)
    //{     
    // //   Response.Write("<script>alert('" + s.fName + "');</script>");
    //   // Label1.Text = s.fName;
    //}   
    //Response.Write("<script>alert('" + s.fPhoto + "');</script>");
    //Response.Write(table.ToString())
    //Response.Write("<script>alert('"+table.ToString()+"');</script>");


}