using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class 收藏服務 : System.Web.UI.Page
{


    FactoryDBDataContext db = new FactoryDBDataContext();
    int id;
    string strURL = "~/img/upp";
    string strimg = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        tMember mb = Session[CDKey.LOGINUSER] as tMember;

        //  string s = Session[CDKey.LOGINUSER].ToString();
     

        id = mb.fIdMember;

        lblSession.Text = id.ToString();




        var linqlikeServices = from l in db.tLIkeServices
                    join m in db.tMember on l.fidStores equals m.fIdMember
                    join se in db.tServices on l.fidServices equals se.fIdServices
                    join s in db.tServicesPic on l.fidServices equals s.fIdServices
                    join g in db.tGalleryPhoto on s.fIdPhoto equals g.fIdPhoto
                    where l.fidMember == id
                    select new
                    {
                        fName = se.fName,
                        fPhoto = g.fPhoto
                    };
        DLLikeServices.DataSource = linqlikeServices;
        DLLikeServices.DataBind();


    }

    
}