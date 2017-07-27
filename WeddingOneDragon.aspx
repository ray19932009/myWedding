<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="WeddingOneDragon.aspx.cs" Inherits="WeddingOneDragon" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label9" runat="server" Text=""></asp:Label>
    <!--婚禮一條龍內容--> 
    <!--連結導航-->
    <div class="breadcrumb">
        	<div class="wrap">
                <div class="container-fluid">
                    <a href="Default.aspx"><i class="icon-home"></i>首頁</a><span>/</span>婚禮一條龍
                 
                    </div>
            </div> 
        </div>
    <!--END 連結導航-->
    <!--進度條-->
    <div class="row-fluid">
        <div style="margin:0 20%">            
            <img id="runningman" src="img/running.gif" style="width:7%;margin-left:20%;"/>
            <div class="progress progress-striped active">                
                <div class="bar" style="width: 25%;"></div>
            </div>        
        </div>
    </div>
    <!--END 進度條-->
    
<div class="container-fluid">
  <div class="row-fluid">
    <div class="span9">
      <!--左邊內容-->
        <!--左邊Tab-->        
                      <div class="tabbable nav-tabs colinfont">
                          
                        <ul class="nav nav-tabs colintabonedragon">
                          <li class="active"><a class="colindisableCss" href="#p1" data-toggle="tab" data-id="1" data-bar="25%" data-barrun="20%">拍婚紗</a></li>
                          <li><a class="colindisableCss" href="#p2" data-toggle="tab" data-id="2" data-bar="50%" data-barrun="45%">婚禮攝影</a></li>
                          <li><a class="colindisableCss" href="#p3" data-toggle="tab" data-id="3" data-bar="75%" data-barrun="70%">新娘秘書</a></li>
                          <li><a class="colindisableCss" href="#p4" data-toggle="tab" data-id="4" data-bar="100%" data-barrun="95%">婚宴場地</a></li>
                        </ul>

                          <div class="colinbtn-group row-fluid">                              
                              <a href="#" class="btn btn-danger btn-large" data-page="1">上個類別</a>
                              <a href="#" class="btn btn-danger btn-large" data-page="2">下個類別</a>
                              <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
                          <div class="btn-group">
                              <a class="btn dropdown-toggle btn-large colindropdown" data-toggle="dropdown" href="#">
                                <span data-sort="1" >更新時間<i class="icon-arrow-down"></i></span>
                                <span class="caret"></span>
                              </a>
                            <ul class="colindropdownmenu dropdown-menu">
                                <li><a data-sort="1" href="#">更新時間<i class="icon-arrow-down"></i></a></li>
                                <li><a data-sort="2" href="#">人氣<i class="icon-arrow-down"></i></a></li>
                            </ul>
                          </div>                              
                          </div>

                          

                        <div class="tab-content colintabonedragoncontent">
                          <div style="overflow-y: hidden;overflow-x: hidden;" class="tab-pane fade in active" id="p1">
                            <!--分頁-->    
                <div class="colinoptions">                                           
                    <ul class="colinfilters">
                        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>                         
                    </ul>                                           
                    <div class="clear"></div>
                </div>
                              <!--子類別1圖片區塊-->
                              <div id="content1">


                    <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
                              
                              
                              </div>                           
            <%--<div class="col-md-6 portfolio-item" style="text-align:center">
                <a href="#">
                    <img class="img-responsive" src="http://placehold.it/750x450" alt=""/>
                </a>
                <div class="item_description">
                                <h6><a href="single_portfolio.html">Pri ridens tibique</a></h6>
                                <div class="descr">Tota ullum soluta at qui. Et nam malorum deleniti eleifend, ei lorem recusabo.</div>
                    <a class="btn btn-info btn-large">選此方案</a>
                            </div>
                
            </div>
                
                <div class="pagination pagination-centered">
                        <ul>
                          <li class="active"><a href="#">1</a></li>
                          <li><a href="#">2</a></li>
                          <li><a href="#">3</a></li>
                          <li><a href="#">4</a></li>
                          <li><a href="#">5</a></li>
                        </ul>
                      </div>
--%>        
                             <!--END子類別1圖片區塊-->                        
                            <!--END 分頁-->
                          </div>
                          <div class="tab-pane fade" id="p2">
                            <!--分頁2-->    
                <div class="colinoptions">                                           
                    <ul class="colinfilters">
                        <!--<li><a href="#" class="btn dark_btn selected">All</a></li>
                        <li><a href="#" class="btn dark_btn">Category 01</a></li>                   
                        <li><a href="#" class="btn dark_btn">Category 02</a></li>
                        <li><a href="#" class="btn dark_btn">Category 03</a></li>--> 
                    </ul>                                           
                    <div class="clear"></div>
                </div>
                           <div id="content2"></div>                           
                            <!--END 分頁2-->
                          </div>
                          <div class="tab-pane fade" id="p3">
                            <!--分頁3-->    
                <div class="colinoptions">                                           
                    <ul class="colinfilters">

                    </ul>                                           
                    <div class="clear"></div>
                </div>
                              <div id="content3"></div>                        
                            <!--END 分頁3-->
                          </div>
                            <div class="tab-pane fade" id="p4">
                            <!--分頁4-->    
                <div class="colinoptions">                                           
                    <ul class="colinfilters">

                    </ul>                                           
                    <div class="clear"></div>
                </div>
                               <div id="content4"></div>                       
                            <!--END 分頁4-->
                          </div>
                        </div>
                      </div>
    <!--END 左邊Tab-->
    </div>
    <div class="span3">
      <!--右邊內容-->
        <div class="Gplus" title="一條龍服務">一條龍服務</div>
            <div class="Gnote" id="oneDragonServices">
                <dl style="color:#606;" class="colindlservices">
                    <dt>拍婚紗</dt>
                    <dd data-num="1"><asp:Label ID="Label5" runat="server" Text=""></asp:Label></dd>
                    <dt>婚禮攝影</dt>
                    <dd data-num="2"><asp:Label ID="Label6" runat="server" Text=""></asp:Label></dd>      
                    <dt>新娘秘書</dt>
                    <dd data-num="3"><asp:Label ID="Label7" runat="server" Text=""></asp:Label></dd>
                    <dt>婚宴場地</dt>
                    <dd data-num="4"><asp:Label ID="Label8" runat="server" Text=""></asp:Label></dd>
                  </dl>
                <div style="text-align:right;margin:5px;"><a class="btn btn-success colinsend btn-large" href="#">送出</a></div>
            </div>
        <br/>
        <div class="Gplus" title="教戰手冊">教戰手冊</div>
            <div class="Gnote" id="manual">
                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
            </div>
        

    </div>
  </div>
</div>
</asp:Content>

