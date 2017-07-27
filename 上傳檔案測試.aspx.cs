using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class 上傳檔案測試 : System.Web.UI.Page
{
    string imgURL = "/img/upp/";
    public int id = 7;
    FactoryDBDataContext db = new FactoryDBDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {
            

            var table = from s in db.tServices
                        where s.fIdStores == id
                        select new
                        {
                            fname = s.fName,
                            fser = s.fIdServices
                        };
            foreach (var o in table)
            {
                DropDownList1.DataTextField = "fname";
                DropDownList1.DataValueField = "fser";
            }
            DropDownList1.DataSource = table;
            DropDownList1.DataBind();




            //var table = from s in db.tServices
            //            where s.fIdServices == id
            //            select s;
            //foreach(var o in table)
            //{
            //    TextBox1.Text = o.fName;
            //    TextBox2.Text = o.fDescription;
            //    tbMax.Text = o.fMaxMoney.ToString();
            //    Textarea.InnerText = o.fContent;
            //}

        }
    }



    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblMsg.Visible = false;
        var table2 = from s in db.tServices
                    where s.fIdServices == Convert.ToInt32(DropDownList1.SelectedItem.Value)
                     select s;
        foreach (var o in table2)
        {
            TextBox1.Text = o.fName;
            TextBox2.Text = o.fDescription;
            tbMax.Text = o.fMaxMoney.ToString();
            Textarea.InnerText = o.fContent;
        }
    }

    protected void update_Click(object sender, EventArgs e)
    {
        tServices x = db.tServices.FirstOrDefault(t => t.fIdServices == Convert.ToInt32(DropDownList1.SelectedItem.Value));
        x.fName = TextBox1.Text;
        x.fDescription = TextBox2.Text;
        x.fMaxMoney = Convert.ToInt32(tbMax.Text);
        x.fContent = Textarea.InnerText;
        x.fUploadTime = DateTime.Now;
        db.SubmitChanges();
        lblMsg.Visible = true;
        TextBox1.Text = "";
        TextBox2.Text = "";
        tbMax.Text = "";
        Textarea.InnerText = "";
    }
}