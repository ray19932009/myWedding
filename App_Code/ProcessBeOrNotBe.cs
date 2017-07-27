using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;

/// <summary>
/// ProcessBeOrNotBe 的摘要描述
/// </summary>
public class ProcessBeOrNotBe
{
    public ProcessBeOrNotBe()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }

    public string GetWebContent(string Url)
    {
        string result = "";
        string strResult = "";
        int startIndex=0;
        int endIndex=0;
        int length = 0;
        try
        {
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(Url);
            //聲明一個HttpWebRequest請求
            request.Timeout = 30000;
            //設置連接逾時時間
            request.Headers.Set("Pragma", "no-cache");
            HttpWebResponse response = (HttpWebResponse)request.GetResponse();
            Stream streamReceive = response.GetResponseStream();
            Encoding encoding = Encoding.GetEncoding("utf-8");
            StreamReader streamReader = new StreamReader(streamReceive, encoding);
            strResult = streamReader.ReadToEnd();
            startIndex = strResult.IndexOf("<b style=\"color:green\">宜</b>");
            endIndex = strResult.IndexOf("</li>", startIndex);
            length = endIndex - startIndex;      
            result = strResult.Substring(startIndex, length).Insert(29,"<br/>");
            result += "<br/>";
            startIndex = strResult.IndexOf("<b style=\"color:red\">忌</b>");
            endIndex = strResult.IndexOf("</li>", startIndex);
            length = endIndex - startIndex;
            result += strResult.Substring(startIndex, length).Insert(27,"<br/>");


        }
        catch
        {
             
        }
        
            return result;
        
        
    }
}