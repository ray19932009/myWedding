using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WeddingToBe : System.Web.UI.Page
{
    ProcessBeOrNotBe p = new ProcessBeOrNotBe();
    FactoryDBDataContext db = new FactoryDBDataContext();
    string year,month;
    int todaydate, todaymonth, todayyear;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["year"] == null || Request["month"] == null)
        {
            year = DateTime.Now.ToString("yyyy");
            month = DateTime.Now.ToString("MM");                        
        } else
        {
            year = Request["year"];
            month = Request["month"];
        }
        todayyear = Convert.ToInt32(DateTime.Now.ToString("yyyy"));
        todaymonth = Convert.ToInt32(DateTime.Now.ToString("MM"));
        todaydate = Convert.ToInt32(DateTime.Now.ToString("dd"));
        Label2.Text += "<div class=\"calendar\" data-toggle=\"calendar\">";
        Label2.Text += "<div class=\"row\">";
        bool isExist = false;
        var table = from t in db.tFate
                    where t.fYear==year && t.fMonth==month
                    select t;
        if (table.Count()>0)
        {
            isExist = true;
        }
        if (!isExist)
        {
            for (int i = 1; i <= DateTime.DaysInMonth(Convert.ToInt32(year), Convert.ToInt32(month)); i++)
            {
                tFate t = new tFate();
                t.fYear = year;
                t.fMonth = month;
                t.fDate = i.ToString();
                t.fContent = p.GetWebContent("http://www.nongli.info/huangli/days/index.php?year=" + year + "&month=" + month + "&date=" + i);
                int index = t.fContent.IndexOf("忌");
                if (t.fContent.Substring(0, index).Contains("嫁娶"))
                {
                    Label2.Text += "<div style='background-color:#FDD;' class=\"col-xs-12 calendar-day\"><time datetime=\"" + year + "-" + month + "-" + i + "\">" + (todaydate == i && todaymonth== Convert.ToInt32(month) && todayyear==Convert.ToInt32(year) ? "<a style='color:#F0F'>今天&nbsp;</a>" : "") + i + "</time>" + t.fContent + "</div>";
                    t.fCanMarried = 1;
                }
                else if (t.fContent.Substring(index, t.fContent.Length - index).Contains("嫁娶"))
                {
                    Label2.Text += "<div style='background-color:#DDD;' class=\"col-xs-12 calendar-day\"><time datetime=\"" + year + "-" + month + "-" + i + "\">" + (todaydate == i && todaymonth == Convert.ToInt32(month) && todayyear == Convert.ToInt32(year) ? "<a style='color:#F0F'>今天&nbsp;</a>" : "") + i + "</time>" + t.fContent + "</div>";
                    t.fCanMarried = 2;
                }
                else
                {
                    Label2.Text += "<div class=\"col-xs-12 calendar-day\"><time datetime=\"" + year + "-" + month + "-" + i + "\">" + (todaydate == i && todaymonth == Convert.ToInt32(month) && todayyear == Convert.ToInt32(year) ? "<a style='color:#F0F'>今天&nbsp;</a>" : "") + i + "</time>" + t.fContent + "</div>";
                    t.fCanMarried = 0;
                }

                if (i % 7 == 0)
                {
                    Label2.Text += "</div><div class=\"row\">";
                }
                db.tFate.InsertOnSubmit(t);
                db.SubmitChanges();
            }
        } else
        {
            int i = 1;
            foreach(tFate f in table)
            {
                if (f.fCanMarried == 1)
                {
                    Label2.Text += "<div style='background-color:#FDD;' class=\"col-xs-12 calendar-day\"><time datetime=\"" + year + "-" + month + "-" + i + "\">" + (todaydate == i && todaymonth == Convert.ToInt32(month) && todayyear == Convert.ToInt32(year) ? "<a style='color:#F0F'>今天&nbsp;</a>" : "") + i + "</time>" + f.fContent + "</div>";  
                } else if (f.fCanMarried == 2)
                {
                    Label2.Text += "<div style='background-color:#DDD;' class=\"col-xs-12 calendar-day\"><time datetime=\"" + year + "-" + month + "-" + i + "\">" + (todaydate == i && todaymonth == Convert.ToInt32(month) && todayyear == Convert.ToInt32(year) ? "<a style='color:#F0F'>今天&nbsp;</a>" : "") + i + "</time>" + f.fContent + "</div>";
                } else if (f.fCanMarried == 0)
                {
                    Label2.Text += "<div class=\"col-xs-12 calendar-day\"><time datetime=\"" + year + "-" + month + "-" + i + "\">" + (todaydate == i && todaymonth == Convert.ToInt32(month) && todayyear == Convert.ToInt32(year) ? "<a style='color:#F0F'>今天&nbsp;</a>" : "") + i + "</time>" + f.fContent + "</div>";
                }
                i++;
            }
        }
        
        Label2.Text += "</div>";
        Label2.Text += "</div>";
        string premonth, preyear, nextmonth, nextyear;
        premonth = (Convert.ToInt32(month) - 1).ToString();
        preyear = year;
        nextmonth = (Convert.ToInt32(month) + 1).ToString();
        nextyear = year;
        if (Convert.ToInt32(month) + 1 == 13)
        {
            nextmonth = "1";
            nextyear = (Convert.ToInt32(year)+1).ToString();
        }
        if (Convert.ToInt32(month) - 1 == 0)
        {
            premonth = "12";
            preyear = (Convert.ToInt32(year) - 1).ToString();
        }
        Label1.Text = "<span class=\"pull-right\"><a href=\"WeddingTobe.aspx?year="+ preyear + "&month="+ premonth + "\" class=\"btn btn-danger btn-large\">上個月</a> <a href=\"WeddingTobe.aspx?year=" + nextyear + "&month=" + nextmonth + "\" class=\"btn btn-danger btn-large\">下個月</a></span><h6><span data-year='"+ year + "'>" + year + "</span>年 <span data-month='"+month+"'>" + month + "</span>月</h6>";
    }
}