using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

/// <summary>
/// ProcessLetter 的摘要描述
/// </summary>
public class ProcessLetters
{
    FactoryDBDataContext db = new FactoryDBDataContext();
    public ProcessLetters()
    {
        
    }

    public void ProcessLetterMsg(tMember member,Label Label)
    {
        List<string> strSender = new List<string>();

        var table = from t in db.tLetter
                    where t.fIdReceiver == member.fIdMember && t.fLetterOrChat == 1
                    orderby t.fSendTime descending
                    select t;

        int countPage = 0;
        foreach (var s in table)
        {
            countPage++;
        }
        countPage = (countPage % 10 == 0 ? countPage / 10 : (countPage / 10) + 1);

        int i = 0;     
        foreach(tLetter l in table.Take(10))
        {
            var sender = from g in db.tMember
                         where g.fIdMember == l.fIdSender
                         select g;           

            foreach (tMember s in sender)
            {
                strSender.Add(s.fName);
            }
            Label.Text += "<div class='row'><div class=\"span8 colinoutbolder\">" +
                         "<div class=\"msgtitle\">" +
                         "<h4>來自" + strSender[i] + "的站內信" + "<a href='#' data-letterid='" + l.fIdILetter + "' class='pull-left btn btn-danger colinletterdel'>刪除</a>" +
                         "<div class=\"pull-right\">"+ l.fSendTime + "</div>"+((l.fIsRead == true) ? "" : "<span class='badge pull-right'>新</span>") +
                         "</h4>" +
                         "</div>" +
                         "<div class=\"msgcontent\">" + l.fContent +
                         "</div>" +
                         "</div></div>";
            i++;
        }
        Label.Text += "<div class='row' style='text-align:center;'><div class='pagination pagination-centered paginationletter'><ul>";
        for (int g = 1; g <= countPage; g++)
        {
            Label.Text += "<li" + (g == 1 ? " class='active'" : "") + "><a href='#'>" + g + "</a></li>";
        }
        Label.Text += "</ul></div></div>";

    }

    public void ProcessLetterMsg(tMember member, HttpContext context, int page)
    {
        List<string> strSender = new List<string>();
        string strMsg = "";
        var table = from t in db.tLetter
                    where t.fIdReceiver == member.fIdMember && t.fLetterOrChat == 1
                    orderby t.fSendTime descending
                    select t;

        int countPage = 0;
        foreach (var s in table)
        {
            countPage++;
        }
        countPage = (countPage % 10 == 0 ? countPage / 10 : (countPage / 10) + 1);

        int i = 0;
        foreach (tLetter l in table.Skip((page-1)*10).Take(10))
        {
            var sender = from g in db.tMember
                         where g.fIdMember == l.fIdSender
                         select g;

            foreach (tMember s in sender)
            {
                strSender.Add(s.fName);
            }
            strMsg += "<div class='row'><div class=\"span8 colinoutbolder\">" +
                         "<div class=\"msgtitle\">" +
                         "<h4>來自" + strSender[i] + "的站內信" + "<a href='#' data-letterid='" +l.fIdILetter +"' class='pull-left btn btn-danger colinletterdel'>刪除</a>" +
                         "<div class=\"pull-right\">"+ l.fSendTime + "</div>"+((l.fIsRead == true) ? "" : "<span class='badge pull-right'>新</span>") +
                         "</h4>" +
                         "</div>" +
                         "<div class=\"msgcontent\">" + l.fContent +
                         "</div>" +
                         "</div></div>";
            i++;
        }
        strMsg += "<div class='row' style='text-align:center;'><div class='pagination pagination-centered paginationletter'><ul>";
        for (int g = 1; g <= countPage; g++)
        {
            strMsg += "<li" + (g == page ? " class='active'" : "") + "><a href='#'>" + g + "</a></li>";
        }
        strMsg += "</ul></div></div>";
        context.Response.Write(strMsg);
    }
}