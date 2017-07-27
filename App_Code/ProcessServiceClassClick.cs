using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

/// <summary>
/// ProcessServiceClassClick 的摘要描述
/// </summary>

public class ProcessServiceClassClick
    {
   
    FactoryDBDataContext db = new FactoryDBDataContext();
    List<tManual> manual = new List<tManual>();
        public ProcessServiceClassClick()
        {

        }

    public void processCity(Label Label) {
        var table = from t in db.tStores
                    join c in db.tCity on t.fIdCity equals c.fIdCity
                    join s in db.tServices on t.fIdStores equals s.fIdStores
                    where s.fIdSubServicesClass == 10
                    select new { cityid = c.fIdCity, city = c.fCity };
        Label.Text += "<div id='city' class=\"btn-group\"><a class=\"btn dropdown-toggle btn-large colindropdowncity\" data-toggle=\"dropdown\" href=\"#\"><span>全部地區</span><span data-city=\"0\" class=\"caret\"></span></a><ul class=\"dropdown-menu colindropdownmenucity\"><li><a data-city='0' href=\"#\">全部地區</a></li>";
        foreach (var c in table)
        {
            Label.Text += "<li><a data-city='"+c.cityid + "' href=\"#\">"+c.city + "</a></li>";
        }        
        Label.Text+= "</ul></div>";
    }

    public void ProcessDeleteServices(int delclass,HttpContext context)
    {
        tServices[] services = (tServices[])context.Session[CDKey.ServiceChoose];
        services[delclass-1] = null;
        context.Session[CDKey.ServiceChoose] = services;
    }

    public void ProcessChooseService(int serviceId,HttpContext context,int serviceclass)
    {
        
        tServices[] services = new tServices[4];
        if(context.Session[CDKey.ServiceChoose]!=null)
        services = (tServices[])context.Session[CDKey.ServiceChoose];
           string strMsg = "";
        var table = from t in db.tServices
                    where t.fIdServices == serviceId
                    select t;
        foreach (tServices s in table)
        {
            strMsg += "<a style='margin-right:3px;' href='#' class='btn btn-danger' data-delclass='" + serviceclass + "'>刪除</a>" + s.fName + " , NT$ " +s.fMaxMoney;
            services[serviceclass-1] = s;            
        }
        context.Session[CDKey.ServiceChoose] = services;
        context.Response.Write(strMsg);
    }

    public void processPage(Label Label)
    {
        var table = (from t in db.tServicesSubClass
                    join o in db.tServicesClass on t.fIdServicesClass equals o.fIdServicesClass
                    join g in db.tServices on t.fIdServicesSubClass equals g.fIdSubServicesClass
                    join p in db.tServicesPic on g.fIdServices equals p.fIdServices
                    join q in db.tGalleryPhoto on p.fIdPhoto equals q.fIdPhoto
                    join w in db.tStores on g.fIdStores equals w.fIdStores
                    join z in db.tMember on g.fIdStores equals z.fIdMember
                     where o.fIdServicesClass == 1
                    orderby g.fUploadTime descending
                    select new { servicename = g.fName, maxmoney = g.fMaxMoney, minmoney = g.fMinMoney, description = g.fDescription, storeid = g.fIdStores, photo = q.fPhoto, serviceid = g.fIdServices,storename=z.fName,storeimg=z.fPhoto });
        int countPage = 0;
        foreach(var s in table)
        {
            countPage++;
        }
        countPage = (countPage % 6 == 0 ?  countPage / 6 :  (countPage / 6) + 1);

        Label.Text += " <div class=\"tz-gallery1\"><div class='row-fluid'>";
        foreach (var s in table.Take(6))
        {
            Label.Text += "<div class='col-md-6 portfolio-item' style='text-align:center;'><div class=\"thumbnail\"><a href='#'><img class='img-responsive'  style='background-size:contain;height:300px;' src='" + s.photo + "' alt=''/></a><div style=\"margin:2%;border-radius:10px; background-color:antiquewhite; padding:2%;\"><div class='item_description'><div class='title_t'><a>$NT " + s.maxmoney + " </a></div><h4>" + s.servicename + "</h4><div style='font-size:16px'>" + s.description + "</div><a data-service='" + s.serviceid + "' class='btn btn-info btn-large'>選此方案</a><hr style=\"margin:1%; padding: 0; \"/><a href='StoreInfo.aspx?fid=" + s.storeid + "'><div style=\"margin:3%;color:#F00;font-weight:bold;\"><img src=\"" + s.storeimg + "\" style=\"margin-right:3%;height:32px; border-radius:43px;display:inline-block;width:32px;\" />" + s.storename + "</div></a></div></div></div></div>";
        }
        Label.Text += "</div></div>";

        Label.Text += "<div class='row' style='text-align:center;'><div class='pagination pagination-centered paginationonedragon'><ul>";
        for(int i=1;i<=countPage; i++)
        {
            Label.Text += "<li"+(i==1? " class='active'":"") +"><a href='#'>"+i+"</a></li>";
        }
        Label.Text += "</ul></div></div>";

    }
    public void processPage(int fIdSubServicesClass,int fIdServicesClass, HttpContext context,int page,int sort,int city)
    {
        var table= from t in db.tServicesSubClass
                   join o in db.tServicesClass on t.fIdServicesClass equals o.fIdServicesClass
                   join g in db.tServices on t.fIdServicesSubClass equals g.fIdSubServicesClass
                   join p in db.tServicesPic on g.fIdServices equals p.fIdServices
                   join q in db.tGalleryPhoto on p.fIdPhoto equals q.fIdPhoto
                   join w in db.tStores on g.fIdStores equals w.fIdStores
                   join z in db.tMember on g.fIdStores equals z.fIdMember
                   where o.fIdServicesClass == fIdServicesClass
                   orderby g.fUploadTime descending
                   select new { servicename = g.fName, maxmoney = g.fMaxMoney, minmoney = g.fMinMoney, description = g.fDescription, storeid = g.fIdStores, photo = q.fPhoto, serviceid = g.fIdServices, storename = z.fName, storeimg = z.fPhoto };
        string strMsg = "";
        if (fIdServicesClass != 4)
        {
            if (fIdSubServicesClass != 0)
            {
                if (sort == 1)
                {
                    table = from t in db.tServicesSubClass
                            join o in db.tServicesClass on t.fIdServicesClass equals o.fIdServicesClass
                            join g in db.tServices on t.fIdServicesSubClass equals g.fIdSubServicesClass
                            join p in db.tServicesPic on g.fIdServices equals p.fIdServices
                            join q in db.tGalleryPhoto on p.fIdPhoto equals q.fIdPhoto
                            join w in db.tStores on g.fIdStores equals w.fIdStores
                            join z in db.tMember on g.fIdStores equals z.fIdMember
                            where o.fIdServicesClass == fIdServicesClass && g.fIdSubServicesClass == fIdSubServicesClass
                            orderby g.fUploadTime descending
                            select new { servicename = g.fName, maxmoney = g.fMaxMoney, minmoney = g.fMinMoney, description = g.fDescription, storeid = g.fIdStores, photo = q.fPhoto, serviceid = g.fIdServices, storename = z.fName, storeimg = z.fPhoto };
                }
                else
                {
                    table = from t in db.tServicesSubClass
                            join o in db.tServicesClass on t.fIdServicesClass equals o.fIdServicesClass
                            join g in db.tServices on t.fIdServicesSubClass equals g.fIdSubServicesClass
                            join p in db.tServicesPic on g.fIdServices equals p.fIdServices
                            join q in db.tGalleryPhoto on p.fIdPhoto equals q.fIdPhoto
                            join w in db.tStores on g.fIdStores equals w.fIdStores
                            join z in db.tMember on g.fIdStores equals z.fIdMember
                            where o.fIdServicesClass == fIdServicesClass && g.fIdSubServicesClass == fIdSubServicesClass
                            orderby w.fPopularity descending
                            select new { servicename = g.fName, maxmoney = g.fMaxMoney, minmoney = g.fMinMoney, description = g.fDescription, storeid = g.fIdStores, photo = q.fPhoto, serviceid = g.fIdServices, storename = z.fName, storeimg = z.fPhoto };
                }

            }
            else
            {
                if (sort == 1)
                {
                    table = from t in db.tServicesSubClass
                            join o in db.tServicesClass on t.fIdServicesClass equals o.fIdServicesClass
                            join g in db.tServices on t.fIdServicesSubClass equals g.fIdSubServicesClass
                            join p in db.tServicesPic on g.fIdServices equals p.fIdServices
                            join q in db.tGalleryPhoto on p.fIdPhoto equals q.fIdPhoto
                            join w in db.tStores on g.fIdStores equals w.fIdStores
                            join z in db.tMember on g.fIdStores equals z.fIdMember
                            where o.fIdServicesClass == fIdServicesClass
                            orderby g.fUploadTime descending
                            select new { servicename = g.fName, maxmoney = g.fMaxMoney, minmoney = g.fMinMoney, description = g.fDescription, storeid = g.fIdStores, photo = q.fPhoto, serviceid = g.fIdServices, storename = z.fName, storeimg = z.fPhoto };
                }
                else
                {
                    table = from t in db.tServicesSubClass
                            join o in db.tServicesClass on t.fIdServicesClass equals o.fIdServicesClass
                            join g in db.tServices on t.fIdServicesSubClass equals g.fIdSubServicesClass
                            join p in db.tServicesPic on g.fIdServices equals p.fIdServices
                            join q in db.tGalleryPhoto on p.fIdPhoto equals q.fIdPhoto
                            join w in db.tStores on g.fIdStores equals w.fIdStores
                            join z in db.tMember on g.fIdStores equals z.fIdMember
                            where o.fIdServicesClass == fIdServicesClass
                            orderby w.fPopularity descending
                            select new { servicename = g.fName, maxmoney = g.fMaxMoney, minmoney = g.fMinMoney, description = g.fDescription, storeid = g.fIdStores, photo = q.fPhoto, serviceid = g.fIdServices, storename = z.fName, storeimg = z.fPhoto };
                }

            }
        } else
        {            
                if (sort == 1)
                {
                if (city == 0)
                {
                    table = from t in db.tServicesSubClass
                            join o in db.tServicesClass on t.fIdServicesClass equals o.fIdServicesClass
                            join g in db.tServices on t.fIdServicesSubClass equals g.fIdSubServicesClass
                            join p in db.tServicesPic on g.fIdServices equals p.fIdServices
                            join q in db.tGalleryPhoto on p.fIdPhoto equals q.fIdPhoto
                            join w in db.tStores on g.fIdStores equals w.fIdStores
                            join z in db.tMember on g.fIdStores equals z.fIdMember
                            where o.fIdServicesClass == fIdServicesClass
                            orderby g.fUploadTime descending
                            select new { servicename = g.fName, maxmoney = g.fMaxMoney, minmoney = g.fMinMoney, description = g.fDescription, storeid = g.fIdStores, photo = q.fPhoto, serviceid = g.fIdServices, storename = z.fName, storeimg = z.fPhoto };
                } else
                {
                    table = from t in db.tServicesSubClass
                            join o in db.tServicesClass on t.fIdServicesClass equals o.fIdServicesClass
                            join g in db.tServices on t.fIdServicesSubClass equals g.fIdSubServicesClass
                            join p in db.tServicesPic on g.fIdServices equals p.fIdServices
                            join q in db.tGalleryPhoto on p.fIdPhoto equals q.fIdPhoto
                            join w in db.tStores on g.fIdStores equals w.fIdStores
                            join z in db.tMember on g.fIdStores equals z.fIdMember
                            where o.fIdServicesClass == fIdServicesClass && w.fIdCity == city
                            orderby g.fUploadTime descending
                            select new { servicename = g.fName, maxmoney = g.fMaxMoney, minmoney = g.fMinMoney, description = g.fDescription, storeid = g.fIdStores, photo = q.fPhoto, serviceid = g.fIdServices, storename = z.fName, storeimg = z.fPhoto };
                }
                
                }
                else
                {
                if (city == 0)
                {
                    table = from t in db.tServicesSubClass
                            join o in db.tServicesClass on t.fIdServicesClass equals o.fIdServicesClass
                            join g in db.tServices on t.fIdServicesSubClass equals g.fIdSubServicesClass
                            join p in db.tServicesPic on g.fIdServices equals p.fIdServices
                            join q in db.tGalleryPhoto on p.fIdPhoto equals q.fIdPhoto
                            join w in db.tStores on g.fIdStores equals w.fIdStores
                            join z in db.tMember on g.fIdStores equals z.fIdMember
                            where o.fIdServicesClass == fIdServicesClass
                            orderby w.fPopularity descending
                            select new { servicename = g.fName, maxmoney = g.fMaxMoney, minmoney = g.fMinMoney, description = g.fDescription, storeid = g.fIdStores, photo = q.fPhoto, serviceid = g.fIdServices, storename = z.fName, storeimg = z.fPhoto };
                } else
                {
                    table = from t in db.tServicesSubClass
                            join o in db.tServicesClass on t.fIdServicesClass equals o.fIdServicesClass
                            join g in db.tServices on t.fIdServicesSubClass equals g.fIdSubServicesClass
                            join p in db.tServicesPic on g.fIdServices equals p.fIdServices
                            join q in db.tGalleryPhoto on p.fIdPhoto equals q.fIdPhoto
                            join w in db.tStores on g.fIdStores equals w.fIdStores
                            join z in db.tMember on g.fIdStores equals z.fIdMember
                            where o.fIdServicesClass == fIdServicesClass && w.fIdCity == city
                            orderby w.fPopularity descending
                            select new { servicename = g.fName, maxmoney = g.fMaxMoney, minmoney = g.fMinMoney, description = g.fDescription, storeid = g.fIdStores, photo = q.fPhoto, serviceid = g.fIdServices, storename = z.fName, storeimg = z.fPhoto };
                }
                
                }            
        }
        
        int countPage = 0;
        foreach (var s in table)
        {
            countPage++;
        }
        countPage = (countPage % 6 == 0 ? countPage / 6 : (countPage / 6) + 1);
        strMsg += " <div class=\"tz-gallery1\"><div class='row-fluid'>";
        foreach (var s in table.Skip(page*6).Take(6))
        {
            strMsg += "<div class='col-md-6 portfolio-item' style='text-align:center;'><div class=\"thumbnail\"><a href='#'><img class='img-responsive' style='background-size:contain;height:300px;' src='" + s.photo+ "' alt=''/></a><div style=\"margin:2%;border-radius:10px; background-color:antiquewhite; padding:5%;\"><div class='item_description'><div class='title_t'><a>$NT " + s.maxmoney+ " </a></div><h4>" + s.servicename + "</h4><div style='font-size:16px'>" + s.description+ "</div><a data-service='" + s.serviceid + "' class='btn btn-info btn-large'>選此方案</a><hr style=\"margin:1%; padding: 0; \"/><a href='StoreInfo.aspx?fid="+ s.storeid + "'><div style=\"margin:3%;color:#F00;font-weight:bold;\"><img src=\"" + s.storeimg + "\" style=\"margin-right:3%;height:32px; border-radius:43px;display:inline-block;width:32px;\" />" + s.storename + "</div></a></div></div></div></div>";
        }
        strMsg += "</div></div>";

        strMsg += "<div class='row' style='text-align:center;'><div class='pagination pagination-centered paginationonedragon'><ul>";
        for (int i = 1; i <= countPage; i++)
        {
            strMsg += "<li" + (i == (page+1) ? " class='active'" : "") + "><a href='#'>" + i + "</a></li>";
        }
        strMsg += "</ul></div></div>";

        context.Response.Write(strMsg);
    }

    public void processServiceSubClassTitle(Label Label)
    {
        int count = 0;
        var table = from t in db.tServicesSubClass
                    join o in db.tServicesClass on t.fIdServicesClass equals o.fIdServicesClass
                    where t.fIdServicesClass == 1
                    select new { subclassid = t.fIdServicesSubClass, subclassname = t.fName, classname = o.fName, classid = o.fIdServicesClass };   

        foreach (var s in table)
        {
            if(count==0)
            Label.Text += "<li><a href='#' data-class='" + s.classid + "' data-subclass='0' class='btn dark_btn selected'>全部" + s.classname+"方案</a></li>";
            Label.Text += "<li><a href='#' data-class='" + s.classid + "' data-subclass='" + s.subclassid + "' class='btn dark_btn'>" + s.subclassname + "</a></li>";            
            count++;
        }
        
    }
    public void processServiceSubClassTitle(int fIdServicesClass, HttpContext context)
        {
        string strMsg = "";
        int count = 0;
        var table = from t in db.tServicesSubClass
                    join o in db.tServicesClass on t.fIdServicesClass equals o.fIdServicesClass
                    where t.fIdServicesClass == fIdServicesClass
                    select new { subclassid = t.fIdServicesSubClass, subclassname = t.fName, classname = o.fName, classid = o.fIdServicesClass };
        foreach (var s in table)
            {
            if (count == 0)
                strMsg += "<li><a href='#' data-class='"+ s.classid + "' data-subclass='0' class='btn dark_btn'>全部" + s.classname + "方案</a></li>";
            if(fIdServicesClass!=4)
            strMsg += "<li><a href='#' data-class='" + s.classid + "' data-subclass='" + s.subclassid + "' class='btn dark_btn'>" + s.subclassname + "</a></li>";            
            count++;
        }        
        context.Response.Write(strMsg);
        }
        public void processMaual(Label Label)
        {
            var table = from t in db.tManual
                        where t.fidServicesClass == 1
                        select t;
            foreach (tManual m in table)
            {
                manual.Add(m);
            }
            Label.Text = "";
            for (int i = 0; i < manual.Count; i++)
            {
                Label.Text += "<dl class='colindl'><dt><a class='btn btn-primary btn-large' data-toggle='modal' data-target='myModal" + i + "'>" + manual[i].fTitle + "</a></dt></dl>" +
                "<div id='myModal" + i + "' style='display:none'><div data-title=''>" + manual[i].fTitle + "</div><div data-content>" + manual[i].fContent + "</div></div>";
            }
        }
    //
        public void processMaual(int fidServicesClass, HttpContext context)
        {
            string strMsg = "";
            var table = from t in db.tManual
                        where t.fidServicesClass == fidServicesClass
                        select t;
            foreach (tManual m in table)
            {
                manual.Add(m);
            }
            for (int i = 0; i < manual.Count; i++)
            {
                strMsg += "<dl class='colindl'><dt><a class='btn btn-primary btn-large' data-toggle='modal' data-target='myModal" + i + "'>" + manual[i].fTitle + "</a></dt></dl>"+
                "<div id='myModal" + i + "' style='display:none'><div data-title=''>"+ manual[i].fTitle + "</div><div data-content>"+ manual[i].fContent + "</div></div>";
            }
            context.Response.Write(strMsg);
        }


    //討論區回覆分頁
    public void processPage1(int fIdTitle, HttpContext context, int page)
    {
        
        var table = from a in db.tDiscussionReply
                    join b in db.tMember on a.fIdMember equals b.fIdMember
                    join c in db.tDiscussion on a.fIdTitle equals c.fIdTitle
                    where a.fIdTitle == fIdTitle
                    select new { a.fIdDiscussionReply, a.fIdTitle, a.fIdMember, a.fSendTime, a.fContent, b.fAccount, b.fPassword, b.fIdentity, b.fPhoto, b.fAddress, b.fEmail, b.fPhone, b.fName, c.fTitle };
        string strMsg = "";


        int countPage = 0;
        foreach (var s in table)
        {
            countPage++;
        }
        countPage = (countPage % 6 == 0 ? countPage / 6 : (countPage / 6) + 1);
        strMsg += "<div class='row-fluid'>";
        foreach (var s in table.Skip(page * 6).Take(6))
        {
            strMsg += "<div class=\"container\"><div class=\"well\" style=\"border-radius:20px;\"><div class=\"media\"><a class=\"pull-right\" href=\"#\"><img class=\"media-object\" style=\"width: 71px; border-radius: 43px;\" src=\"" + (s.fPhoto == null ? "img/head.png" : s.fPhoto) + "\"></a><div class=\"media-body\"><h2 class=\"media-heading\">" + s.fTitle + "</h2><p class=\"text-right\">" + "發佈人:" + s.fName + "</p><p class=\"text-right\">" + "發表日期:" + s.fSendTime + "</p><hr/><p style=\"font-size:18px;\">" + (s.fContent).Replace("\r\n", "<br/>") + "</p><ul class=\"list-inline list-unstyled\"><hr/></div></div></div></div>";
        }
        strMsg += "</div>";

        strMsg += "<div class='row' style='text-align:center;'><div class='pagination pagination-centered paginationonedragon12'><ul>";
        for (int i = 1; i <= countPage; i++)
        {
            strMsg += "<li" + (i == (page + 1) ? " class='active'" : "") + "><a href='#'>" + i + "</a></li>";
        }
        strMsg += "</ul></div></div>";

        context.Response.Write(strMsg);

    }



    //討論區回覆分頁END
    //問報價分頁
    public void processPageAsk(HttpContext context, int page)
    {

        var table = from a in db.tAskPrice
                    join b in db.tMember on a.fIdMember equals b.fIdMember
                    orderby a.fSendTime descending
                    select new { fIdTitle = a.fIdTitle, fSendTime = a.fSendTime,fTitle = a.fTitle, fContent = a.fContent, fPhoto = b.fPhoto, fName = b.fName, Title = a.fContent.Length > 20 ? a.fContent.Substring(1, 20) + "..." : a.fContent };
        string strMsg = "";


        int countPage = 0;
        foreach (var s in table)
        {
            countPage++;
        }
        countPage = (countPage % 6 == 0 ? countPage / 6 : (countPage / 6) + 1);
        strMsg += "<div class='row-fluid'>";
        foreach (var s in table.Skip(page * 6).Take(6))
        {
            DateTime STime = DateTime.Now; //起始日
            DateTime ETime = s.fSendTime; //結束日
            TimeSpan Total = STime.Subtract(ETime); //日期相減
            double dayCount = Total.Days;
            int num = (from a in db.tAnswerPrice
                       where a.fIdTitle == s.fIdTitle
                       select a.fIdTitle).Count();


            strMsg += "<div class=\"container\"><div class=\"well\" style=\"margin-right:30%; border-radius:20px;\"><div class=\"media\"><a class=\"pull-left\" href=\"#\"><img class=\"img-responsive\" alt=\"iamgurdeeposahan\" src=\"" + (s.fPhoto == null ? "img/head.png" : s.fPhoto) + "\" style=\"width: 71px; border-radius: 43px;\"></a><div class=\"media-body\"><h2 class=\"media-heading\"><a href=\"AskPriceMsg.aspx?fid=" + s.fIdTitle + "\">" + s.fTitle + "</a></h2><p class=\"text-left\" style=\"font-size:18px;\">" + s.fName + "</p><hr/><p style = \"font-size:16px;\" >" + s.Title + "</ p ><hr/><ul class=\"list-inline list-unstyled\"><li><span><i class=\"glyphicon glyphicon-calendar\"></i> " + dayCount + "天前</span></li><li>|</li><span><i class=\"glyphicon glyphicon-comment\"></i> 共有"+ num + "則回覆</span><li>|</li></ul></div></div></div></div>";
            
        }
        strMsg += "</div>";

        strMsg += "<div class='row' style='text-align:center;'><div class='pagination pagination-centered paginationonedragonask'><ul>";
        for (int i = 1; i <= countPage; i++)
        {
            strMsg += "<li" + (i == (page + 1) ? " class='active'" : "") + "><a href='#'>" + i + "</a></li>";
        }
        strMsg += "</ul></div></div>";

        context.Response.Write(strMsg);

    }

    //問報價分頁END
    //問報價回覆分頁
    public void processPageAnswer(int fid,HttpContext context, int page)
    {
      
        var table = from a in db.tAnswerPrice
                    join b in db.tAskPrice on a.fIdTitle equals b.fIdTitle
                    join c in db.tMember on a.fIdStore equals c.fIdMember
                    where a.fIdTitle == fid
                    select new { a.fContent, a.fIdServices, a.fIdStore, a.fIdTitle, a.fSendTime, c.fName, c.fPhoto, b.fTitle };
        string strMsg = "";


        int countPage = 0;
        foreach (var s in table)
        {
            countPage++;
        }
        countPage = (countPage % 6 == 0 ? countPage / 6 : (countPage / 6) + 1);
        strMsg += "<div class='row-fluid'>";
        foreach (var s in table.Skip(page * 6).Take(6))
        {
            strMsg += "<div class=\"container\"><div class=\"well\" style=\"margin-right:30%;background-color:#cfcfcf\"><div class=\"media\"><a class=\"pull-left\" href=\"#\"><img class=\"img-responsive\" alt=\"iamgurdeeposahan\" src=\"" + (s.fPhoto == null ? "img/head.png" : s.fPhoto) + "\" style=\"width: 71px; border-radius: 43px;\"></a><div class=\"media-body\"><h2 class=\"media-heading\">" + s.fTitle + "</h2><p class=\"text-left\" style=\"font-size:18px;\">" + s.fName + "</p><br /><p style = \"font-size:16px;\" >" + s.fContent + "</p><a data-answerid='" + s.fIdTitle + "' data-answerstoreid='" + s.fIdStore + "' data-servicesid='" + s.fIdServices + "'  data-identity='" + (context.Session[CDKey.LOGINUSER] != null ? (context.Session[CDKey.LOGINUSER]).ToString() : "3") + "' class='btn btn-info btn-large'>我要選此方案</a></div></div></div></div>";

        }
        strMsg += "</div>";

        strMsg += "<div class='row' style='text-align:center;'><div class='pagination pagination-centered paginationonedragonAnswer'><ul>";
        for (int i = 1; i <= countPage; i++)
        {
            strMsg += "<li" + (i == (page + 1) ? " class='active'" : "") + "><a href='#'>" + i + "</a></li>";
        }
        strMsg += "</ul></div></div>";

        context.Response.Write(strMsg);

    }

    //問報價回覆分頁END
    //討論區分頁
    public void processPageforum(HttpContext context, int page)
    {

        var table = from a in db.tDiscussion
                    join b in db.tMember on a.fIdMember equals b.fIdMember
                    orderby a.fSendTime descending
                    select new { a.fIdTitle, a.fIdMember, a.fSendTime, a.fTitle, a.fContent, b.fAccount, b.fPassword, b.fIdentity, b.fPhoto, b.fAddress, b.fEmail, b.fPhone, b.fName, Title = a.fContent.Length > 20 ? a.fContent.Substring(1, 20) + "..." : a.fContent };
        string strMsg = "";


        int countPage = 0;
        foreach (var s in table)
        {
            countPage++;
        }
        countPage = (countPage % 6 == 0 ? countPage / 6 : (countPage / 6) + 1);
        strMsg += "<div class='row-fluid'>";
        foreach (var s in table.Skip(page * 6).Take(6))
        {
            int Num = (from a in db.tDiscussionReply
                       where a.fIdTitle == s.fIdTitle
                       select a.fIdTitle).Count();
            DateTime STime = DateTime.Now; //起始日
            DateTime ETime = (DateTime)(s.fSendTime); //結束日
            TimeSpan Total = STime.Subtract(ETime); //日期相減
            double dayCount = Total.Days;


            strMsg += "<div class=\"container\"><div class=\"well\" style=\"border-radius:20px;\"><div class=\"media\"><a class=\"pull-left\" href=\"#\"><img class=\"img-responsive\" alt=\"iamgurdeeposahan\" src=\"" + (s.fPhoto == null ? "img/head.png" : s.fPhoto) + "\" style=\"width: 71px; border-radius: 43px;\"></a><div class=\"media-body\"><h2 class=\"media-heading\"><a href=forumMsg.aspx?fIdTitle=" + s.fIdTitle + ">" + s.fTitle + "</a></h2><p class=\"text-left\" style=\"font-size:18px;\">" + s.fName + "</p><hr/><p style = \"font-size:16px;\" >" + s.Title + "</p><hr/><ul class=\"list-inline list-unstyled\"><li><span><i class=\"glyphicon glyphicon-calendar\"></i> " + (Convert.ToString(dayCount) == "0" ? "今天發佈" : Convert.ToString(dayCount) + "天前發佈") + "</span></li><li>|</li><span><i class=\"glyphicon glyphicon-comment\"></i> 共有則" + Num + "回覆</span><li>|</li></ul></div></div></div></div>";

        }
        strMsg += "</div>";

        strMsg += "<div class='row' style='text-align:center;'><div class='pagination pagination-centered paginationonedragonforum'><ul>";
        for (int i = 1; i <= countPage; i++)
        {
            strMsg += "<li" + (i == (page + 1) ? " class='active'" : "") + "><a href='#'>" + i + "</a></li>";
        }
        strMsg += "</ul></div></div>";

        context.Response.Write(strMsg);

    }

    //討論區分頁END
}
