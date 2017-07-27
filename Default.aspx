<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!--page_container-->
  
        <!--slider-->  
        <div id="main_slider">
            <div class="camera_wrap" id="camera_wrap_1">
                <div data-src="img/slider/1.jpg"></div>
                <div data-src="img/slider/2.jpg"></div>
                <div data-src="img/slider/3.jpg"></div>                                        
            </div><!-- #camera_wrap_1 -->
              </div>
            <div class="clear"></div>	
              
        <!--//slider-->
               <div align="center" style="background-color:rgb(255,230,200); text-align:center; padding:1%;align-items:center;margin:auto;position:relative;"><h1>懶的找婚禮店家？</h1>
<div class="well" id="default" style="border-radius:20px;text-align:center;margin:0 auto;"><div><span class="">
<i class=""></i></span><select id="defaultselect" style="font-size:24px;width:100%;height:10%;"><option value="0">我想找的婚禮服務是...</option>
<option value="拍婚紗">拍婚紗</option>
<option value="婚禮攝影">婚禮攝影</option>
<option value="新娘秘書">新娘秘書</option>
<option value="婚宴會館">婚宴會館</option>
<option value="婚紗禮服">婚紗禮服</option>
<option value="婚禮佈置">婚禮佈置</option>
<option value="婚禮企劃/主持人">婚禮企劃/主持人</option>
<option value="婚鞋">婚鞋</option>
<option value="婚禮小物">婚禮小物</option>
<option value="喜帖、謝卡">喜帖、謝卡</option>
<option value="其它">其它</option>
</select>  
</div>
<div>
 <span class="pic_icon">
<i class="ic_sort"></i></span>
 <input style="font-size:24px;width:100%;height:10%;" id="picker" class="datepicker" type="text" size="8" maxlength="10" placeholder="我想詢問的檔期是..."/>
</div>
 <div class="btn_area">
  <a href="#" class="btn btn-danger btn-large">免費詢問報價
  </a>
 </div>
</div>
 </div>
        <!--planning-->

        <!--//planning-->

        <!--Welcome-->

        <!--//Welcome-->         
        
        <!--featured works-->
     
        <!--//latest posts--> 
    
    <!--//page_container-->

</asp:Content>

