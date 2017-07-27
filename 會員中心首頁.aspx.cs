using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class 會員中心首頁 : System.Web.UI.Page
{
    FactoryDBDataContext db = new FactoryDBDataContext();
    string imgURL = "/img/upp/";
    ProcessLetters p = new ProcessLetters();
    public int id = 2;

    protected void Page_Load(object sender, EventArgs e)
    {
        tMember mb = Session[CDKey.LOGINUSER] as tMember;



            if (Page.IsPostBack == false)
            {

            var in3Services = from c in db.tCalendar
                              join s in db.tServices on c.fIdServices equals s.fIdServices
                              where c.fIdMember == id && c.fDate < DateTime.Now.Date
                              select new
                              {
                                  finName = s.fName,
                                  finDate = c.fDate.Value.Month.ToString() + "月" + c.fDate.Value.Day.ToString() + "日",
                                  fidSer = s.fIdServices
                              };
            DllOverTime.DataSource = in3Services;
            DllOverTime.DataBind();

            var disc = (from d in db.tDiscussion
                        where d.fIdMember == id
                        orderby d.fSendTime descending
                        select new
                        {
                            ftitle = d.fTitle,
                            ftime = d.fSendTime
                        }).Take(3);
            DLDis.DataSource = disc;
            DLDis.DataBind();

            var discR = (from r in db.tDiscussionReply
                         join d in db.tDiscussion on r.tMember equals d.tMember
                         where r.fIdMember == id
                         orderby r.fSendTime descending
                         select new
                         {
                             ftitle = d.fTitle,
                             ftime = r.fSendTime
                         }).Take(3);
            DLDisR.DataSource = discR;
            DLDisR.DataBind();

        }
        }







    protected void btngoEva_Click(object sender, EventArgs e)
    {
        
        
    }
}