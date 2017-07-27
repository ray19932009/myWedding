using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class 作品集測試 : System.Web.UI.Page
{
    int id;
    FactoryDBDataContext db = new FactoryDBDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        var table = from g in db.tGallery
                    join gp in db.tGalleryPhoto on g.fIdGallery equals gp.fIdGallery
                    where g.fIdStores == 6
                    select new
                    {
                       fPhoto = gp.fPhoto,
                        fName = g.fName

                    };
        DataList1.DataSource = table;
        DataList1.DataBind();
                   

    }
}