<%@ WebHandler Language="C#" Class="ProcessBeOrNotToBe" %>

using System;
using System.Web;
using System.Linq;

public class ProcessBeOrNotToBe : IHttpHandler {
    ProcessBeOrNotBe p = new ProcessBeOrNotBe();
        FactoryDBDataContext db = new FactoryDBDataContext();
    string year,month,date,strMsg;
    public void ProcessRequest (HttpContext context) {
        strMsg = "";
        if (context.Request["year"] == null || context.Request["month"] == null)
        {
            year = DateTime.Now.ToString("yyyy");
            month = DateTime.Now.ToString("MM");
        } else
        {
            year = context.Request["year"];
            month = context.Request["month"];
        }
        strMsg += "<div class=\"calendar\" data-toggle=\"calendar\">";
        strMsg += "<div class=\"row\">";
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
                    strMsg += "<div style='background-color:#FDD;' class=\"col-xs-12 calendar-day\"><time datetime=\"" + year + "-" + month + "-" + i + "\">" + i + "</time>" + t.fContent + "</div>";
                    t.fCanMarried = 1;
                }
                else if (t.fContent.Substring(index, t.fContent.Length - index).Contains("嫁娶"))
                {
                    strMsg += "<div style='background-color:#DDD;' class=\"col-xs-12 calendar-day\"><time datetime=\"" + year + "-" + month + "-" + i + "\">" + i + "</time>" + t.fContent + "</div>";
                    t.fCanMarried = 2;
                }
                else
                {
                    strMsg += "<div class=\"col-xs-12 calendar-day\"><time datetime=\"" + year + "-" + month + "-" + i + "\">" + i + "</time>" + t.fContent + "</div>";
                    t.fCanMarried = 0;
                }

                if (i % 7 == 0)
                {
                    strMsg += "</div><div class=\"row\">";
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
                    strMsg += "<div style='background-color:#FDD;' class=\"col-xs-12 calendar-day\"><time datetime=\"" + year + "-" + month + "-" + i + "\">" + i + "</time>" + f.fContent + "</div>";
                } else if (f.fCanMarried == 2)
                {
                    strMsg += "<div style='background-color:#DDD;' class=\"col-xs-12 calendar-day\"><time datetime=\"" + year + "-" + month + "-" + i + "\">" + i + "</time>" + f.fContent + "</div>";
                } else if (f.fCanMarried == 0)
                {
                    strMsg += "<div class=\"col-xs-12 calendar-day\"><time datetime=\"" + year + "-" + month + "-" + i + "\">" + i + "</time>" + f.fContent + "</div>";
                }
                i++;
            }
        }

        strMsg += "</div>";
        strMsg += "</div>";
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}