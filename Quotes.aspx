<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Quotes.aspx.cs" Inherits="Quotes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style>
        .well ul{
            width:100%;
            list-style-type:none;
        }
        .datepicker{
            width:100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!--報價頁面-->
    <div class="container" style="width:100%; padding:0;" >
        <div class="well" style="text-align:center;">
<h1>徵求店家報價( <i class="must">*</i> 為必填)</h1><ul><li><span class="item_name"><i class="must">*</i>需求類別：</span>
<select id="servies" runat="server" style="width:50%;height:30%; font-size:24px;"><option value='0'>請選擇類別</option>
<option value='拍婚紗' selected='selected'>拍婚紗</option>
<option value='婚禮攝影' >婚禮攝影</option>
<option value='新娘秘書' >新娘秘書</option>
<option value='婚宴會館' >婚宴會館</option>
<option value='婚紗禮服' >婚紗禮服</option><option value='婚禮佈置' >婚禮佈置</option>
<option value='婚禮企劃/主持人' >婚禮企劃/主持人</option><option value='婚鞋' >婚鞋</option>
<option value='婚禮小物' >婚禮小物</option><option value='喜帖、謝卡' >喜帖、謝卡</option>
<option value='其它' >其它</option></select>
<span class="sattus" id="business_type_check" style="display:none"><i></i></span>  </li>
<li>
<span class="item_name"><i class="must">*</i>需求日期：</span>
<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</li>
<li>
 <span class="item_name"><i class="must">&nbsp;</i>需求地點：
 <select id='space'  runat="server" style="width:50%;height:30%; font-size:24px;">
 <option value='0'>選擇縣市</option>
 <option value='台北市' >台北市</option><option value='新北市' >新北市</option>
 <option value='桃園市' >桃園市</option><option value='新竹市' >新竹市</option>
 <option value='新竹縣' >新竹縣</option><option value='基隆市' >基隆市</option>
 <option value='台中市' >台中市</option><option value='苗栗縣' >苗栗縣</option>
 <option value='彰化縣' >彰化縣</option><option value='雲林縣' >雲林縣</option>
 <option value='南投縣' >南投縣</option><option value='高雄市' >高雄市</option>
 <option value='台南市' >台南市</option><option value='嘉義市' >嘉義市</option>
 <option value='嘉義縣' >嘉義縣</option><option value='屏東縣' >屏東縣</option>
 <option value='澎湖縣' >澎湖縣</option><option value='宜蘭縣' >宜蘭縣</option>
 <option value='花蓮縣' >花蓮縣</option><option value='台東縣' >台東縣</option>
 <option value='金門縣' >金門縣</option><option value='連江縣' >連江縣</option>
</select></span></li>
<li><span class="item_name" ><i class="must">*</i>需求內容：</span>
<textarea  style="width:50%;height:30%; font-size:20px; font-family:'微軟正黑體';" cols="80" rows="10" id="descri" name="descri" placeholder="1. 預計拍攝時間：

2. 風格：時尚韓風/中式龍鳳掛/浪漫甜美/自然清新/不拘

3. 備註：" class="basic_input n_textarea w_100">
</textarea><span class="sattus" id="descri_check" style="display:none"><i></i></span></li></ul><ul><li class="sub_title"></li>
</li><li><span class="item_name"><i class="must"></span>
<label for="request_type_6001">
</li><li id="request_type_li_6002"><span class="item_name"><i class="must">
    <asp:Button ID="Button1" runat="server" CssClass="btn btn-danger btn-large" Text="送出問價" OnClick="Button1_Click" />
    </div>
    </div>
    

          <script>
      $(function () {
          $(".datepicker").datepicker();
      });
  </script>
</asp:Content>

