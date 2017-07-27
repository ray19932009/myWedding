<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="舊準.aspx.cs" Inherits="memberCentre_New" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.js"></script>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'/>
    <link href="css/newAndStores.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--會員中心內容 新人-->
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
 <div class="col-lg-6 col-sm-6" style="width:100%">
    <div class="card hovercard">
        <div class="card-background">

            <img class="card-bkimg" alt="" src="img/centerback.jpg" />
            <!-- http://lorempixel.com/850/280/people/9/ -->
        </div>
        <div class="useravatar">
            
                <asp:Image ID="imgPic" runat="server"  onerror="this.src='/img/head.png'" />        
                
                 </div>
        <div class="card-info"> <span class="card-title">
                    <asp:Label ID="lblUserName" runat="server" Text=""></asp:Label>

           </span>

        </div>
    </div>
    </div>
    

<div class="tabbable tabs-left colinfont">
        <ul class="nav nav-tabs colintab" style="margin-left: 15%">
            <li class="active"><a href="#lE" data-toggle="tab">會員中心</a></li>
            <li><a href="#lA" data-toggle="tab">個人資料</a></li>
            <li><a href="#lF" data-toggle="tab">服務進度</a></li>
            <li><a href="#lB" data-toggle="tab">喜歡的店家</a></li>
            <li><a href="#lC" data-toggle="tab">收藏的服務</a></li>
            <li><a href="#lD" data-toggle="tab">個人行事曆</a></li>
            <li><a href="#lG" data-toggle="tab">我的站內信</a></li>
        </ul>
        <div class="tab-content colintabcontent" style="width: 55%">

            <div class="tab-pane active" id="lE">
                <div class="aa">
                    <div class="a1">
                        <div style="float: left; width: 33%; height: 100%; border:solid 0.1px;" >
                           <div >
                                 <asp:Label ID="lblNew" runat="server" Text="Label"></asp:Label>
                           </div>
                        </div>
                        <div style="float: left; width: 33%; height: 100%; border:solid 0.1px; ">
                            <div style="text-align:center; margin-top:15%;">
                                 <asp:Label ID="lblLikestore" runat="server" Text="尚未有喜歡的店家" BackColor="#FEC8C5"  Font-Names="標楷體" Font-Size="X-Large"></asp:Label>
                           </div>
                        </div>
                        <div style="float: left; width: 33%; height: 100%; border:solid 0.1px;">
                           <div style="text-align:center; margin-top:15%;">
                                 <asp:Label ID="lblLikeServices" runat="server" Text="尚未開始收藏"  BackColor="#FEC8C5"  Font-Names="標楷體" Font-Size="X-Large"></asp:Label>
                           </div>
                        </div>
                    </div>
                    <div class="a2">
                        <p>最近的討論區</p>
                    </div>
                    <div class="a3">
                        <p>我的詢價</p>
                    </div>

                </div>
            </div>
            <div class="tab-pane" id="lA">  <!--左方大DIV-->
                <div>
                    <ul class="center">
                        <li>&nbsp;</li>
                        <li>                        
                            <label style="font-weight:bold">準新人名</label>
                            <asp:TextBox ID="txtName" runat="server" Width="210px" Font-Size="X-Large" Height="40"></asp:TextBox>
                        </li>
                        <li>&nbsp;</li>
                        <li>
                            <label style="font-weight:bold">行動電話</label>
                           <asp:TextBox ID="txtPhone" runat="server" Width="210px" Font-Size="X-Large" Height="40"></asp:TextBox> <img src="img/iconPhone.png" height="40" width="40" />
                            &nbsp;</li>
                        <li>&nbsp;</li>
                        <li>
                            <label style="font-weight:bold">信箱</label>
                            <asp:TextBox ID="txtEmail" runat="server" Width="350px" Font-Size="X-Large" Height="40"></asp:TextBox><img src="img/iconEmail.png" height="40" width="40" />
                            &nbsp;</li>
                        <li>&nbsp;</li>
                        <li>
                            <label style="font-weight:bold">地址</label>
                            <asp:TextBox ID="txtAddress" runat="server" Width="450px" Font-Size="X-Large" Height="40"></asp:TextBox><img src="img/iconHome.png" height="40" width="40" />
                            &nbsp;</li>
                        <li>&nbsp;</li>
                         <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                        <li>
                            <!--  <asp:Button ID="btnUpDate" runat="server" OnClick="btnUpDate_Click" Text="更新資料" Width="235px" />-->
                            <asp:ImageButton ID="ImageButton1" runat="server" OnClick="btnUpDate_Click" ToolTip="更新資料" ImageUrl="~/img/update.png" Height="80px" Width="80px" AlternateText="更新資料" />
                        </li>
                     </ContentTemplate>

            </asp:UpdatePanel>
                    </ul>
                </div>
                <!--左方大DIV結束-->
                <!--右方小DIV-->
                <div class="pic2">

                     <div class="useravatar">
                <asp:Image ID="imgPic2" runat="server"  onerror="this.src='/img/head.png'"  Height="200" Width="170" />
           
                     </div>
                   
                    <ul style="list-style-type: none;  text-align:center">
                        <li>
                            <asp:Label ID="lblHead" runat="server" Text=""></asp:Label></li>
                    </ul>
                    <asp:FileUpload ID="picUpload" runat="server" />
                    <ul style="list-style-type: none;">
                        <li>
                            <asp:Button ID="Button1" runat="server" OnClick="picUpload_Click" Text="上傳" />
                        </li>
                    </ul>

                </div>
                <!--右方小DIV結束-->


            </div>
            <!--服務進度開始-->
            <div class="tab-pane" id="lF">

                <div class="tabbable">
                    <ul class="nav nav-tabs">
                        <!--上方分頁選擇器-->
                        <li class="active"><a href="#a1" data-toggle="tab">未開始服務</a></li>
                        <li><a href="#a2" data-toggle="tab">進行中服務</a></li>
                        <li><a href="#a3" data-toggle="tab">已完成服務</a></li>
                        <!--上方分頁選擇器-->
                    </ul>
                    <div class="tab-content">
                        <!--分頁選擇器對應內容-->
                        <div class="tab-pane active" id="a1">
                            <p>I'm in Section 1.</p>
                        </div>
                        <div class="tab-pane" id="a2">
                            <p>Howdy, I'm in Section 2.</p>
                        </div>
                        <div class="tab-pane" id="a3">
                            <p>Howdy, I'm in Section 2.</p>
                        </div>
                        <!--分頁選擇器對應內容-->
                    </div>
                </div>
            </div>
            <!--服務進度結束-->
            <!--喜歡的店家開始-->
            <div class="tab-pane" id="lB">

                <div style="height:600px">
                    <asp:Label  ID="lblSession" runat="server" Text=""></asp:Label>
                    <asp:DataList ID="DLLikeStores" runat="server" RepeatDirection="Horizontal" RepeatColumns="4">
                        <ItemTemplate>
                            <br />
                            <asp:ImageButton ID="imgBtnLikeStores" runat="server" onerror="this.src='/img/noob.png'" ImageUrl='<%# Eval("fPhoto") %>' Height="190px" Width="170px" />
                            &nbsp;&nbsp;
                            <br />
                            <asp:Label ID="lblLikeStores" runat="server" Text='<%# Eval("fName") %>'  Width="160px"  style="TEXT-ALIGN:left;"  ></asp:Label>
                        </ItemTemplate>

                    </asp:DataList>
                </div>
            </div>
            <!--喜歡的店家結束-->
            <!--收藏的服務開始-->
            <div class="tab-pane" id="lC" >
                <div>
                    <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                    <asp:DataList ID="DLLikeServices" runat="server" RepeatDirection="Horizontal" RepeatColumns="4">
            <ItemTemplate>
                
                <asp:Label ID="lblservices" runat="server" Text='<%# Eval("fName") %>' Font-Bold="True"  ></asp:Label>
                <br /><br />
                <asp:ImageButton ID="imgBtnservices" runat="server" Height="213px" ImageUrl='<%# Eval("fPhoto") %>' Width="185px" />&nbsp;
                
                <br />
            </ItemTemplate>
               
        </asp:DataList>


                </div>
            </div>
            <!--收藏的服務結束-->
            <!--開始-->
            <div class="tab-pane" id="lD">
                <p>What up girl, this is Section D.</p>
            </div>
            <!--行事曆結束-->
            <!--站內信-->

             <div class="tab-pane" id="lG">
                  <div class="lettercontent container">  
                    <asp:Label ID="lblLetter" runat="server" Text=""></asp:Label>   
                  </div>
            </div>
             <!--站內信-->
        </div>
    </div>
            
    


</asp:Content>
