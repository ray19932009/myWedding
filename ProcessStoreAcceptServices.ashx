<%@ WebHandler Language="C#" Class="ProcessStoreAcceptServices" %>

using System;
using System.Web;
using System.Linq;

public class ProcessStoreAcceptServices : IHttpHandler {
    FactoryDBDataContext db = new FactoryDBDataContext();
    string date = "";
    int storeid = 0, memberid = 0;
    string storename = "", membername = "", servicename = "";
    public void ProcessRequest (HttpContext context) {
        if (context.Request["calendarid"] != null)
        {
            //找資料
            var table = from t in db.tCalendar
                        where t.fIdCalendar == Convert.ToInt32(context.Request["calendarid"])
                        select t;
            if (table.Count() > 0)
            {
                foreach(tCalendar c in table)
                {
                    c.fAccepted = true;
                    date = (c.fDate).ToString();
                    storeid = c.fIdStores;

                    var service = from s in db.tServices
                                  where s.fIdServices == c.fIdServices
                                  select s;
                    if (service.Count() > 0)
                    {
                        foreach(tServices s in service)
                        {
                            servicename = s.fName;
                        }
                    }
                    var msg = from m in db.tMember
                              where m.fIdMember == c.fIdStores || m.fIdMember == c.fIdMember
                              select m;
                    if (msg.Count() > 0)
                    {
                        foreach(tMember m in msg)
                        {
                            if (m.fIdentity == 0)
                            {
                                memberid = m.fIdMember;
                                membername = m.fName;
                            }
                            else
                            {
                                storeid = m.fIdMember;
                                storename = m.fName;
                            }

                        }
                    }
                }
            }
            if (context.Request["yes"] !=null)
            {//當廠商按下接受
                tAvailableTime a = new tAvailableTime();
                a.fAvailableTime = Convert.ToDateTime(date);
                a.fIdStores = storeid;
                db.tAvailableTime.InsertOnSubmit(a);

                tLetter l = new tLetter();
                l.fIdReceiver = memberid;
                l.fContent = "您已經與 " + storename + " 廠商配對成功！詳細時間請於專屬行事曆查看";
                l.fIdSender = storeid;
                l.fIsRead = false;
                l.fLetterOrChat = 1;
                l.fSendTime = DateTime.Now;
                db.tLetter.InsertOnSubmit(l);

                tLetter g = new tLetter();
                g.fIdReceiver = storeid;
                g.fContent = "您已經與 " + membername + " 新人配對成功！詳細時間請於專屬行事曆查看";
                g.fIdSender = memberid;
                g.fIsRead = false;
                g.fLetterOrChat = 1;
                g.fSendTime = DateTime.Now;
                db.tLetter.InsertOnSubmit(g);

                db.SubmitChanges();
            }
            else
            {//當廠商按下拒絕
                tLetter l = new tLetter();
                l.fIdReceiver = memberid;
                l.fContent = "您已經被 " + storename + " 廠商拒絕了 "+servicename+" 服務方案。<br/>理由是：<br/>"+context.Request["reason"].Replace("\n","<br/>");
                l.fIdSender = storeid;
                l.fIsRead = false;
                l.fLetterOrChat = 1;
                l.fSendTime = DateTime.Now;
                db.tLetter.InsertOnSubmit(l);

                tLetter g = new tLetter();
                g.fIdReceiver = storeid;
                g.fContent = "您已經殘忍拒絕了 " + membername + " 新人選擇的 "+servicename+" 服務方案！";
                g.fIdSender = memberid;
                g.fIsRead = false;
                g.fLetterOrChat = 1;
                g.fSendTime = DateTime.Now;
                db.tLetter.InsertOnSubmit(g);

                if (table.Count() > 0)
                {
                    foreach(tCalendar c in table)
                    {
                            db.tCalendar.DeleteOnSubmit(c);
                    }
                }
                db.SubmitChanges();
            }

        }

    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}