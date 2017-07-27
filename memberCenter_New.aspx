<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="memberCenter_New.aspx.cs" Inherits="新會員中心準新人" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="css/newAndStores.css" rel="stylesheet" />

    <style>
        #calendar {
            max-width: 900px;
            margin: 0 auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--內容-->

    <div style="padding: 0 5% 0 10%">
        <div class="tabbable tabs-left colinfont">
            <div class="col-lg-3 col-md-3 ">
                <div class="panel panel-default">
                    <div style="height: 100%">
                        <div class="media">
                            <div>
                                <center> <asp:Image ID="imgPic" runat="server"  onerror="this.src='/img/head.png'" Height="250" Width="200" /></center>
                                <br />
                                <center><asp:Label ID="lblUserName" runat="server" Text="名子"></asp:Label></center>
                                <br />
                            </div>

                            <div class="media-body">

                                <div class="form-group">
                                    <center><strong><a class="active btn btn-danger btn-lg btn-block " href="#lE"  data-toggle="tab">會員中心</a></strong></center>
                                </div>
                                <div class="form-group">
                                    <center><strong><a href="#lA" class="btn btn-danger btn-lg btn-block qqa"  data-toggle="tab">個人資料</a></strong></center>
                                </div>
                                <div class="form-group">
                                    <center><strong><a href="#lF" class="btn btn-danger btn-lg btn-block qqe"  data-toggle="tab">服務進度</a></strong></center>
                                </div>
                                <div class="form-group">
                                    <center><strong><a href="#lB" class="btn btn-danger btn-lg btn-block"  data-toggle="tab">喜歡的店家</a></strong></center>
                                </div>
                                <div class="form-group">
                                    <center><strong><a href="#lC" class="btn btn-danger btn-lg btn-block"  data-toggle="tab">收藏的服務</a></strong></center>
                                </div>
                                <div class="form-group">
                                    <center><strong><a class="colincalendara btn btn-danger btn-lg btn-block" href="#lD" data-toggle="tab">個人行事曆</a></strong></center>
                                </div>
                                <div class="form-group">
                                    <center><strong><a href="#lH" class="colinchats btn btn-danger btn-lg btn-block" data-toggle="tab">訊息紀錄</a></strong></center>
                                </div>
                                <div class="form-group">
                                    <center><strong><a href="#lG" class="colinletter btn btn-danger btn-lg btn-block"  data-toggle="tab">站內信</a></strong></center>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tz-gallery" style="margin-right: 60px; padding-top: 0;">
                <div class="tab-content colintabcontent">

                    <div class="tab-pane active" id="lE">
                        <div class="breadcrumb">
                            <div class="wrap">
                                <div class="container-fluid" style="text-align: left">
                                    <a href="Default.aspx"><i class="icon-home"></i>首頁</a><span>/</span>會員中心
                 
                                </div>
                            </div>
                        </div>
                        <div class="aa">
                            <div class="a1">
                                <div style="float: left; width: 33%; height: 100%; border-right: solid 0.1px;">
                                    <div>
                                        <asp:Label ID="lblNew" runat="server" Text="尚未排定行程"  Font-Names="標楷體" Font-Size="X-Large"></asp:Label>
                                    </div>
                                </div>
                                <div style="float: left; width: 33%; height: 100%; border-right: solid 0.1px;">
                                    <div style="text-align: center;">
                                        <asp:Label ID="lblLikestore" runat="server" Text="尚未有喜歡的店家" Font-Names="標楷體" Font-Size="X-Large"></asp:Label>
                                    </div>
                                </div>
                                <div style="float: left; width: 33%; height: 100%;">
                                    <div style="text-align: center;">
                                        <asp:Label ID="lblLikeServices" runat="server" Text="尚未開始收藏" Font-Names="標楷體" Font-Size="X-Large"></asp:Label>
                                    </div>
                                </div>
                            </div>
                            <div class="a2">

                                <div style="background-color: #ede7e9;"><a>討論區</a></div>
                                <div style="width: 50%; float: left">
                                    <a>最近的發言</a>

                                </div>
                                <div style="width: 45%; float: left">
                                    <a>最近的回文</a>

                                </div>
                                <div class="newAsk">
                                    <asp:DataList ID="DLDis" runat="server" Width="100%" ForeColor="#333333">
                                        <AlternatingItemStyle BackColor="White"></AlternatingItemStyle>

                                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White"></FooterStyle>

                                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White"></HeaderStyle>

                                        <ItemStyle BackColor="#fecffb" ForeColor="#333333"></ItemStyle>
                                        <ItemTemplate>
                                            <div style="border-bottom: solid 0.1px; height: 50px; border-color: #ede7e9">
                                                <a style="font-size: 20px;" href="forumMsg.aspx?fIdTitle=<%# Eval("fidtit") %>"><%# Eval("ftitle") %></a>
                                                <br />
                                                <div style="float: left; padding-left: 50%;">
                                                    <asp:Label Text='<%# Eval("ftime") %>' runat="server" ID="fSendTimeLabel" Font-Size="10px" />
                                                </div>
                                            </div>


                                        </ItemTemplate>
                                        <SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy"></SelectedItemStyle>
                                    </asp:DataList>

                                </div>
                                <div class="newRAsk">
                                    <asp:DataList ID="DLDisR" runat="server" Width="100%">
                                        <AlternatingItemStyle BackColor="#fecffb" ForeColor="#333333"></AlternatingItemStyle>

                                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White"></FooterStyle>
                                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White"></HeaderStyle>


                                        <ItemStyle BackColor="White"></ItemStyle>
                                        <ItemTemplate>
                                            <div style="border-bottom: solid 0.1px; border-color: #ede7e9">
                                                <a style="font-size: 20px;" href="forumMsg.aspx?fIdTitle=<%# Eval("fidtit") %>"><%# Eval("ftitle") %></a>
                                                <asp:Image ID="Image1" ToolTip='<%# Eval("fcon") %>' ImageUrl="~/img/searchh.png" runat="server" Width="24" Height="24" />
                                                <br />
                                                <div style="float: left; padding-left: 50%;">
                                                    <asp:Label Text='<%# Eval("ftime") %>' runat="server" ID="fSendTimeLabel" Font-Size="10px" />
                                                </div>
                                            </div>

                                        </ItemTemplate>
                                    </asp:DataList>
                                </div>
                            </div>
                            <div class="a3">
                                <div style="text-align: center">
                                    <div style="background-color: #ede7e9;">
                                        <p>我的詢價</p>
                                    </div>
                                    <div style="text-align: left; text-align: left; overflow-x: hidden; overflow-y: auto; height: 150px;">
                                        <asp:DataList ID="DLAskP" runat="server" Width="100%">
                                            <AlternatingItemStyle BackColor="#fecffb" ForeColor="#333333"></AlternatingItemStyle>

                                            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White"></FooterStyle>
                                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White"></HeaderStyle>


                                            <ItemStyle BackColor="White"></ItemStyle>
                                            <ItemTemplate>
                                                <div style="border-bottom: solid 0.1px; height: 50px; border-color: #ede7e9">
                                                    <a style="font-size: 20px;" href="AskPriceMsg.aspx?fid=<%# Eval("fidtit") %>"><%# Eval("ftitle") %></a>
                                                    <br />
                                                    <div style="float: left; padding-left: 30%;">
                                                        <asp:Label Text='<%# Eval("ftime") %>' runat="server" ID="fSendTimeLabel" Font-Size="10px" />
                                                    </div>
                                                </div>
                                            </ItemTemplate>

                                        </asp:DataList>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="tab-pane" id="lA">

                        <!--左方大DIV-->
                           <div class="breadcrumb">
                            <div class="wrap">
                                <div class="container-fluid" style="text-align: left">
                                    <a href="Default.aspx"><i class="icon-home"></i>首頁</a><span>/</span>個人資料
                 
                                </div>
                            </div>
                        </div>
                                    <div class="center">
                                    <br />
                                    <div class="form-group">
                                        <label style="font-size: 25px; float: left;">準新人名:</label>
                                        <asp:TextBox ID="txtName" runat="server" Width="350px" Font-Size="X-Large" Height="30"></asp:TextBox>
                                    </div>
                                    <br />
                                    <div class="form-group">
                                        <label style="font-size: 25px; float: left;">行動電話:</label>
                                        <asp:TextBox ID="txtPhone" runat="server" Width="350px" Font-Size="X-Large" Height="30"></asp:TextBox>


                                    </div>
                                    <br />
                                    <div class="form-group">
                                        <label style="font-size: 25px; float: left;">信箱:</label>
                                        <asp:TextBox ID="txtEmail" runat="server" Width="400px" Font-Size="X-Large" Height="30"></asp:TextBox>
                                    </div>
                                    <br />
                                    <div class="form-group">
                                        <label style="font-size: 25px; float: left;">地址:</label>
                                        <asp:TextBox ID="txtAddress" runat="server" Width="500px" Font-Size="X-Large" Height="30"></asp:TextBox>
                                    </div>
                                    <br />
                                    <asp:Label ID="lblMsg" runat="server" Visible="False" Font-Bold="True" Font-Size="20px" ForeColor="#CC0000"></asp:Label>
                                     <div class="succ" style="color:red;font-weight:bold;"> </div>
                                    <div class="form-group">
                                        <div class='Acg'>
                                            <asp:Button CssClass="btn btn-info btn-large" ID="Button2" runat="server" OnClick="btnUpDate_Click" Text="更新資料" />
                                        </div>
                                    </div>
                                </div>
                                <!--左方大DIV結束-->
                                <!--右方小DIV-->
                                <div class="pic2">

                                    <div class="useravatar">
                                        <div>
                                            <asp:Image ID="imgPic2" onerror="this.src='/img/head.png'" runat="server" Height="200" Width="170" />
                                        </div>
                                    </div>
                                    <div style="list-style-type: none; text-align: center">
                                        <asp:FileUpload ID="picUpload" runat="server" /><div style="float: right">
                                            <asp:Button ID="Button1" class="btn btn-info" Width="100px" runat="server" OnClick="picUpload_Click" Text="更新相片" />

                                        </div>
                                    </div>
                                </div>
                           

                        <!--右方小DIV結束-->
                    </div>
                    <!--服務進度開始-->
                    <div class="tab-pane" id="lF">
                           <div class="breadcrumb">
                            <div class="wrap">
                                <div class="container-fluid" style="text-align: left">
                                    <a href="Default.aspx"><i class="icon-home"></i>首頁</a><span>/</span>服務進度
                 
                                </div>
                            </div>
                        </div>
                        
                        <div class="tabbable">
                            <ul class="nav nav-tabs">
                                <!--上方分頁選擇器-->
                                <li class="active"><a href="#a1" data-toggle="tab">未開始服務</a></li>
                                <li><a href="#a2" data-toggle="tab">進行中服務</a></li>
                                <li><a href="#a3" data-toggle="tab">已完成服務(尚未評價)</a></li>
                                <li><a href="#a4" data-toggle="tab">已完成服務(已評價)</a></li>
                                <li><a href="#a5" data-toggle="tab">待確認服務</a></li>

                            </ul>
                            <div class="tab-content">
                                <div class="Evasuccess" style="text-align:left;color:red;"></div>
                                <div class="tab-pane active" id="a1">
                                    <div>
                                        <div style="float: left; width: 100%;">
                                            <br />
                                            <div style="width: 300px; float: left; text-align: left">
                                                <asp:Label ID="Label5" Font-Size="30px" Font-Bold="true" Font-Names="標楷體" runat="server" Text="服務"></asp:Label>
                                            </div>
                                            <div style="width: 200px; float: left; text-align: left">
                                                預約時間<asp:Label ID="Label6" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="newservices">
                                            <asp:DataList runat="server" ID="DLNotYetTime" CaptionAlign="Top">
                                                <ItemTemplate>
                                                    <hr />
                                                    <br />
                                                    <div style="height: 30px">
                                                        <div style="width: 300px; float: left; text-align: left">
                                                            <asp:Label ID="lblNotyetName" Font-Size="30px" Font-Bold="true" Font-Names="標楷體" runat="server" Text='<%# Eval("finName") %>'></asp:Label>
                                                        </div>
                                                        <div style="width: 200px; float: left; text-align: left">
                                                            預約時間<asp:Label ID="lblNotyetTime" runat="server" Text='<%# Eval("finDate") %>'></asp:Label>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:DataList>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="a2">
                                    <div>
                                        <div style="float: left; width: 100%;">
                                            <br />
                                            <div style="width: 300px; float: left; text-align: left">
                                                <asp:Label ID="Label1" Font-Size="30px" Font-Bold="true" Font-Names="標楷體" runat="server" Text="服務"></asp:Label>
                                            </div>
                                            <div style="width: 200px; float: left; text-align: left">
                                                預約時間<asp:Label ID="Label4" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="newservices">
                                            <asp:DataList runat="server" ID="DllSameTime" CaptionAlign="Top">
                                                <ItemTemplate>
                                                    <hr />
                                                    <br />
                                                    <div style="height: 30px">
                                                        <div style="width: 300px; float: left; text-align: left">
                                                            <asp:Label ID="lblSameTime" Font-Size="30px" Font-Bold="true" Font-Names="標楷體" runat="server" Text='<%# Eval("finName") %>'></asp:Label>
                                                        </div>
                                                        <div style="width: 200px; float: left; text-align: left">
                                                            預約時間<asp:Label ID="lblNotyetTime" runat="server" Text='<%# Eval("finDate") %>'></asp:Label>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:DataList>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="a3">

                                    <div>
                                        <div style="float: left; width: 100%;">
                                            <br />
                                            <div style="width: 300px; float: left; text-align: left">
                                                <asp:Label ID="lbl服務" Font-Size="30px" Font-Bold="true" Font-Names="標楷體" runat="server" Text="服務"></asp:Label>
                                            </div>
                                            <div style="width: 200px; float: left; text-align: left">
                                                預約時間<asp:Label ID="lbl預約" runat="server"></asp:Label>
                                            </div>
                                            <div style="float: left">
                                                <asp:Label ID="lbl評價" runat="server" Text="前往評價"></asp:Label>
                                            </div>
                                        </div>
                                        <br />
                                        <div style="float: left">
                                            <div class="newservices">
                                                <asp:DataList runat="server" ID="DllOverTime">
                                                    <ItemTemplate>
                                                        <hr />
                                                        <br />
                                                        <div style="height: 30px">
                                                            <div style="width: 300px; float: left; text-align: left">
                                                                <asp:Label ID="lblOverTime" Font-Size="30px" Font-Bold="true" Font-Names="標楷體" runat="server" Text='<%# Eval("finName") %>'></asp:Label>
                                                            </div>
                                                            <div style="width: 200px; float: left; text-align: left">
                                                                預約時間<asp:Label ID="lblNotyetTime" runat="server" Text='<%# Eval("finDate") %>'></asp:Label>                                                                
                                                            </div>
                                                            <div style="float: left">
                                                                <a class="btn btn-success" href="StoreEvaluation.aspx?Sid=<%# Eval("fidSer") %>&Mid=<%= id %>">評價此服務</a>
                                                            </div>
                                                        </div>

                                                    </ItemTemplate>
                                                </asp:DataList>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="a4">
                                    <div>
                                        <div style="float: left; width: 100%;">
                                            <br />
                                            <div style="width: 300px; float: left; text-align: left">
                                                <asp:Label ID="Label7" Font-Size="30px" Font-Bold="true" Font-Names="標楷體" runat="server" Text="服務"></asp:Label>
                                            </div>
                                            <div style="width: 200px; float: left; text-align: left">
                                                預約時間<asp:Label ID="Label8" runat="server"></asp:Label>
                                            </div>
                                            <div style="float: left">
                                                <asp:Label ID="Label9" runat="server" Text="您評價的分數"></asp:Label>
                                            </div>
                                        </div>
                                        <br />
                                        <div style="float: left">
                                            <div class="newservices">
                                                <asp:DataList runat="server" ID="DataList1">
                                                    <ItemTemplate>
                                                        <hr />
                                                        <div style="height: 30px">
                                                            <div style="width: 300px; float: left; text-align: left; padding-top: 0">
                                                                <asp:Label ID="lblOverTime" Font-Size="30px" Font-Bold="true" Font-Names="標楷體" runat="server" Text='<%# Eval("finName") %>'></asp:Label>
                                                            </div>
                                                            <div style="width: 200px; float: left; text-align: left">
                                                                預約時間<asp:Label ID="lblNotyetTime" runat="server" Text='<%# Eval("finDate") %>'></asp:Label>
                                                            </div>
                                                            <div style="float: left">
                                                                <a><%# Eval("fidStar")+"分" %></a>
                                                            </div>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:DataList>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="a5">
                                    <div style="float: left; width: 100%;">
                                        <br />
                                        <div style="width: 300px; float: left; text-align: left">
                                            <asp:Label ID="Label10" Font-Size="30px" Font-Bold="true" Font-Names="標楷體" runat="server" Text="服務"></asp:Label>
                                        </div>
                                        <div style="width: 200px; float: left; text-align: left">
                                            預約時間<asp:Label ID="Label11" runat="server"></asp:Label>
                                        </div>
                                    </div>
                                    <br />
                                    <div class="newservices">
                                        <asp:DataList runat="server" ID="DLLnotAccepted">
                                            <ItemTemplate>
                                                <hr />
                                                <div style="height: 30px">
                                                    <div style="width: 300px; float: left; text-align: left; padding-top: 0">
                                                        <asp:Label ID="lblOverTime" Font-Size="30px" Font-Bold="true" Font-Names="標楷體" runat="server" Text='<%# Eval("finName") %>'></asp:Label>
                                                    </div>
                                                    <div style="width: 200px; float: left; text-align: left">
                                                        預約時間<asp:Label ID="lblNotyetTime" runat="server" Text='<%# Eval("finDate") %>'></asp:Label>
                                                    </div>

                                                </div>
                                            </ItemTemplate>
                                        </asp:DataList>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--服務進度結束-->
                    <!--喜歡的店家開始-->
                    <div class="tab-pane" id="lB">
                         <div class="breadcrumb">
                            <div class="wrap">
                                <div class="container-fluid" style="text-align: left">
                                    <a href="Default.aspx"><i class="icon-home"></i>首頁</a><span>/</span>喜歡的店家
                 
                                </div>
                            </div>
                        </div>
                        <div style="height: 700px; overflow-y: auto; overflow-x: hidden">
                            <asp:Label ID="lblSession" Visible="false" runat="server" Text=""></asp:Label>
                            <asp:DataList ID="DLLikeStores" runat="server" RepeatDirection="Horizontal" RepeatColumns="3">
                                <ItemTemplate>
                                    <div class="thumbnail" style="margin-right: 10px;">
                                        <div class="nav-justified">
                                            <a href="StoreInfo.aspx?fid=<%# Eval("fStore") %>">
                                                <br />
                                                <asp:Image ID="imgBtnLikeStores" runat="server" onerror="this.src='/img/noob.png'" ImageUrl='<%# Eval("flikeStorePhoto") %>' Height="200px" Width="300px" />
                                                <br />
                                                <div style="margin: 0 5px 0 0; height: 60px; padding-top: 15px; background-color: #ffccff; border-top: solid 0.1px; border-color: #cec4c4">
                                                    <a href="StoreInfo.aspx?fid=<%# Eval("fStore") %>" style="width: 280px; height: 50px; text-align: center; color: black"><%# Eval("flikeStoreName") %></a>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                    </div>
                                </ItemTemplate>
                            </asp:DataList>
                        </div>
                    </div>
                    <!--喜歡的店家結束-->
                    <!--收藏的服務開始-->
                    <div class="tab-pane" id="lC">
                           <div class="breadcrumb">
                            <div class="wrap">
                                <div class="container-fluid" style="text-align: left">
                                    <a href="Default.aspx"><i class="icon-home"></i>首頁</a><span>/</span>收藏的服務
                 
                                </div>
                            </div>
                        </div>
                        <div style="height: 700px; overflow-y: auto; overflow-x: hidden">
                            <asp:DataList ID="DLLikeServices" runat="server" RepeatDirection="Horizontal" RepeatColumns="3" CaptionAlign="Top">
                                <ItemTemplate>
                                    <div class="thumbnail" style="margin-right: 10px">
                                        <br />
                                        <a href="gallery_2.aspx?fid=<%# Eval("fStore") %>&sid=<%# Eval("fServices") %> ">
                                            <asp:Image ID="imgBtnservices" runat="server" ImageUrl='<%# Eval("fLikeServicePhoto") %>' Height="200px" Width="300px" />&nbsp;
                                        <div style="margin: 0 5px 0 0; height: 60px; padding-top: 15px; background-color: #ffccff; border-top: solid 0.1px; border-color: #cec4c4">
                                            <a href="gallery_2.aspx?fid=<%# Eval("fStore") %>&sid=<%# Eval("fServices") %> " style="width: 280px; height: 50px; text-align: center; color: black"><%# Eval("fLikeServiceName") %></a>
                                        </a>
                                    </div>
                                    </div>
                                </ItemTemplate>

                            </asp:DataList>
                        </div>
                    </div>
                    <!--收藏的服務結束-->
                    <!--行事曆開始-->
                    <div class="tab-pane" id="lD">
                           <div class="breadcrumb">
                            <div class="wrap">
                                <div class="container-fluid" style="text-align: left">
                                    <a href="Default.aspx"><i class="icon-home"></i>首頁</a><span>/</span>個人行事曆
                 
                                </div>
                            </div>
                        </div>
                        <div id='calendar'></div>
                        <br/>

                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <span style="color:#ff6a00;">待確認之方案:</span>
                            <asp:DropDownList ID="DropDownList1" runat="server" style="display:inline-block;margin-left:1%;" CssClass="form-control span3" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                            <asp:Label ID="Label2" runat="server" Text=""></asp:Label>                              
                        </ContentTemplate>
                    </asp:UpdatePanel>

                    </div>
                    <!--行事曆結束-->
                    <!--訊息紀錄開始-->
                    <div class="tab-pane" id="lH">
                           <div class="breadcrumb">
                            <div class="wrap">
                                <div class="container-fluid" style="text-align: left">
                                    <a href="Default.aspx"><i class="icon-home"></i>首頁</a><span>/</span>訊息紀錄
                 
                                </div>
                            </div>
                        </div>
                        <div class="chatcontent">
                        <%--<asp:Label ID="MainMsg" runat="server" Text=""></asp:Label>--%>
                        </div>
                        <div class="colinpaganation">
                        </div>
                    </div>
                    <!--訊息紀錄結束-->
                    <!--站內信-->

                    <div class="tab-pane" id="lG">
                           <div class="breadcrumb">
                            <div class="wrap">
                                <div class="container-fluid" style="text-align: left">
                                    <a href="Default.aspx"><i class="icon-home"></i>首頁</a><span>/</span>站內信
                 
                                </div>
                            </div>
                        </div>
                        <div class="lettercontent container">
                            <%--<asp:Label ID="lblLetter" runat="server" Text=""></asp:Label>--%>
                        </div>
                    </div>
                    <!--站內信-->
                </div>
            </div>
        </div>
    </div>
</asp:Content>
