using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

/// <summary>
/// ProcessChatMsg 的摘要描述
/// </summary>
public class ProcessChatMsg
{
    FactoryDBDataContext db = new FactoryDBDataContext();
    public ProcessChatMsg()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public void ProcessSend(string content, int senderid, int receiverid)
    {
        tLetter t = new tLetter();
        t.fContent = content;
        t.fIdReceiver = receiverid;
        t.fIdSender = senderid;
        t.fIsRead = false;
        t.fLetterOrChat = 2;
        t.fSendTime = DateTime.Now;
        
        db.tLetter.InsertOnSubmit(t);
        db.SubmitChanges();
    }

    public string ProcessRefreshChatBox(int anotherid, int loginid, int more)
    {
        string loginpic = "";
        string loginname = "";
        string anotherpic = "";
        string anothername = "";
        var member = from m in db.tMember
                     where loginid == m.fIdMember || anotherid == m.fIdMember
                     select m;
        if (member.Count() > 0)
        {
            foreach (tMember mem in member)
            {
                if (mem.fIdMember == loginid)
                {
                    loginpic = mem.fPhoto;
                    loginname = mem.fName;
                }                       
                else
                {
                    anotherpic = mem.fPhoto;
                    anothername = mem.fName;
                }
                    
            }
        }
        string strMsg = "";
        var table = from t in db.tLetter
                    where ((t.fIdSender == loginid && t.fIdReceiver == anotherid) || (t.fIdSender == anotherid && t.fIdReceiver == loginid)) && t.fLetterOrChat == 2
                    orderby t.fSendTime descending
                    select t;
        if (table.Count() > 0)
        {
            foreach (tLetter l in table.Take((more + 1) * 30))
            {
                if (loginid == l.fIdReceiver)
                    strMsg = strMsg.Insert(0, "<li class=\"left clearfix\"><div class=\"row\"><div class=\"pull-left colinchatimgdiv\"><img src=\"" + anotherpic + "\" alt=\"" + anothername + "\" class=\"colinchatimg img-circle\"/></div><div class=\"colinchatcontentdiv\"><div class=\"chat-body clearfix\"><strong class=\"colinchatname pull-left\">" + anothername + "</strong><br/><small class=\"pull-right text-muted\"><span class=\"glyphicon glyphicon-time\"></span>" + l.fSendTime + "</small><br/><p style='font-size:22px;'>" + l.fContent + "</p></div></div></div></li>");
                else
                    strMsg = strMsg.Insert(0, "<li class=\"right clearfix\"><div class=\"row\"><div class=\"pull-right colinchatimgdiv\"><img src=\"" + loginpic + "\" alt=\"" + loginname + "\" class=\"colinchatimg img-circle\"/></div><div class=\"colinchatcontentdiv\"><div class=\"chat-body clearfix\"><strong class=\"colinchatname pull-right\">" + loginname + "</strong><br/><small class=\"pull-left text-muted\"><span class=\"glyphicon glyphicon-time\"></span>" + l.fSendTime + "</small><br/><p style='font-size:22px;'>" + l.fContent + "</p></div></div></div></li>");
            }
            
        }
        return strMsg;
    }

}