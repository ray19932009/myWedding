<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="memberCenter_Store.aspx.cs" Inherits="新會員中心廠商" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="css/newAndStores.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- 左邊店家資訊 -->

    <style>
        .star {
            width: 50px;
            height: 75px;
            cursor: default;
            background-repeat: no-repeat;
            display: block;
        }

        .fullEmptyStar {
            background-image: url("img/star0.png");
        }

        .emptyStar {
            background-image: url("img/star1.png");
        }
    </style>
     
    <div style="padding: 0 5% 0 10%">
        <div class="tabbable tabs-left colinfont">
            <div class="col-lg-3 col-md-3">
                <div class="panel panel-default">
                    <div style="height: 100%">
                        <div class="media">
                            <div>
                                <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" BorderColor="White" BorderStyle="None" BackColor="White" Height="0px" Width="0px" />
                                <asp:Button ID="Button5" runat="server" BorderColor="White" BorderStyle="None" BackColor="White" Height="0px" Width="0px" OnClick="Button5_Click" />
                                <%--<img class="thumbnail img-responsive" src="https://pic.marry.com.tw/2016/08/23/1430/2017/06/19/trim_149783566001148700_450x300.jpg" width="300px" height="300px">--%>
                                <center> <asp:Image ID="imgPic" runat="server" onerror="this.src='/img/head.png'"  Height="250" Width="200" /></center>
                                <asp:Label ID="Label1" runat="server" Text="廠商:"></asp:Label>
                                <br />
                                <center><asp:Label ID="lblUserName" runat="server" Text="名子"></asp:Label></center>
                                <br />
                                <div class="hiper">
                                    <asp:HyperLink ID="HyperLink3" class="btn btn-success btn-lg2 " runat="server" NavigateUrl="~/storeAddServices.aspx">新增方案</asp:HyperLink>
                                    <asp:HyperLink ID="HyperLink2" class="btn btn-success btn-lg2 " runat="server" NavigateUrl="~/storeAddGallery.aspx">新增作品集</asp:HyperLink>

                                </div>
                            </div>

                            <div class="media-body">
                                <div class="form-group">
                                    <center><strong><a class="active btn btn btn-warning btn-lg btn-block"  href="#lE" data-toggle="tab">會員中心</a></strong></center>
                                </div>
                                <div class="form-group">
                                    <center><strong><a href="#lA" class="btn btn-warning btn-lg btn-block qqa"  data-toggle="tab">個人資料</a></strong></center>
                                </div>
                                
                                <div class="form-group">
                                    <center><strong><a class="btn btn-warning btn-lg btn-block qqc" href="#lG" data-toggle="tab">我的方案</a></strong></center>
                                </div>

                                <div class="form-group">
                                    <center><strong><a class="btn btn-warning btn-lg btn-block qqb" href="#lC" data-toggle="tab">我的作品</a></strong></center>
                                </div>
                                <div class="form-group">
                                    <center><strong><a class="colincalendara btn btn-warning btn-lg btn-block" href="#lB"  data-toggle="tab">個人行事曆</a></strong></center>
                                </div>
                                <div class="form-group">
                                    <center><strong><a class="colinchats btn btn-warning btn-lg btn-block" href="#lF" data-toggle="tab">訊息紀錄</a></strong></center>
                                </div>
                                <div class="form-group">
                                    <center><strong><a class="colinletter btn btn-warning btn-lg btn-block" href="#lD" data-toggle="tab">站內信</a></strong></center>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 右邊資訊 -->
            <div class="tz-gallery" style="padding-top: 0;">
                <div class="tab-content colintabcontent" style="padding-top: 0">
                    <div class="tab-pane active" id="lE">
                        <div class="breadcrumb">
                            <div class="wrap">
                                <div class="container-fluid" style="text-align: left">
                                    <a href="Default.aspx"><i class="icon-home"></i>首頁</a><span>/</span>會員中心
                 
                                </div>
                            </div>
                        </div>
                        <div class="aa">
                            <div class="b1">

                                <div style="background-color: #ede7e9"><a>討論區</a></div>
                                <div style="width: 50%; float: left">
                                    <a>最近的發言</a>

                                </div>
                                <div style="width: 50%; float: left">
                                    <a>最近的回文</a>

                                </div>
                                <div class="dldis">
                                    <asp:DataList ID="DLDis" runat="server" Width="100%" CellPadding="4" ForeColor="#333333">
                                        <AlternatingItemStyle BackColor="White"></AlternatingItemStyle>

                                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White"></FooterStyle>

                                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White"></HeaderStyle>

                                        <ItemStyle BackColor="#fecffb" ForeColor="#333333"></ItemStyle>
                                        <ItemTemplate>
                                            <div style="border-bottom: solid 0.1px; height: 50px; border-color: #ede7e9">
                                                <a style="font-size: 20px;" href="forumMsg.aspx?fIdTitle=<%# Eval("fidtit") %>"><%# Eval("ftitle") %></a>
                                                <br />
                                                <div style="float: left; padding-left: 45%;">
                                                    <asp:Label Text='<%# Eval("ftime") %>' runat="server" ID="fSendTimeLabel" Font-Size="10px" />
                                                </div>
                                            </div>

                                        </ItemTemplate>
                                    </asp:DataList>

                                </div>
                                <div class="dldisR">
                                    <asp:DataList ID="DLDisR" runat="server" Width="100%">
                                        <AlternatingItemStyle BackColor="#fecffb" ForeColor="#333333"></AlternatingItemStyle>

                                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White"></FooterStyle>
                                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White"></HeaderStyle>


                                        <ItemStyle BackColor="White"></ItemStyle>
                                        <ItemTemplate>
                                            <div style="border-bottom: solid 0.1px; height: 50px; border-color: #ede7e9">
                                                <a style="font-size: 20px;" href="forumMsg.aspx?fIdTitle=<%# Eval("fidtit") %>"><%# Eval("ftitle") %></a>
                                                <asp:Image ID="Image1" ToolTip='<%# Eval("fcon") %>' ImageUrl="~/img/searchh.png" runat="server" Width="24" Height="24" />
                                                <br />
                                                <div style="float: left; padding-left: 50%;">
                                                    <asp:Label Text='<%# Eval("ftime") %>' runat="server" ID="fSendTimeLabel" Font-Size="10px" />
                                                </div>
                                        </ItemTemplate>
                                    </asp:DataList>
                                </div>
                            </div>
                            <br />
                            <div class="b2">
                                <div style="background-color: #ede7e9; text-align: center"><a>我的報價</a></div>
                                <div class="storeAnser">
                                    <asp:DataList ID="DLAsk" runat="server" Width="100%">
                                        <AlternatingItemStyle BackColor="White"></AlternatingItemStyle>

                                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White"></FooterStyle>

                                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White"></HeaderStyle>

                                        <ItemStyle BackColor="#fecffb" ForeColor="#333333"></ItemStyle>
                                        <ItemTemplate>
                                            <div style="border-bottom: solid 0.1px; height: 50px; border-color: #ede7e9">
                                                <a style="font-size: 20px;" href="AskPriceMsg.aspx?fid=<%# Eval("fidtit") %>"><%# Eval("ftitle") %></a>
                                                <asp:Image ID="Image1" ToolTip='<%# Eval("fcon") %>' ImageUrl="~/img/searchh.png" runat="server" Width="24" Height="24" />
                                            </div>
                                            <div style="float: left; padding-left: 50%;">
                                                <asp:Label Text='<%# Eval("ftime") %>' runat="server" ID="fSendTimeLabel" Font-Size="10px" />
                                            </div>
                                        </ItemTemplate>
                                    </asp:DataList>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane" id="lA">
                        <div class="breadcrumb">
                            <div class="wrap">
                                <div class="container-fluid" style="text-align: left">
                                    <a href="Default.aspx"><i class="icon-home"></i>首頁</a><span>/</span>個人資料
                 
                                </div>
                            </div>
                        </div>
                        <!--左方大DIV-->
                        <div class="centerS" style="font-size: 30px; float: left; text-align: left; width: 65%; height: 950px;">
                            <asp:Label ID="lblMsg" runat="server" Visible="False" Font-Bold="True" Font-Size="20px" ForeColor="#CC0000"></asp:Label>
                            <div class="form-group">
                                <label>廠商名</label>
                                <asp:TextBox ID="txtStore" runat="server" Width="60%" Height="30" Font-Size="25px"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>電話</label>
                                <asp:TextBox ID="txtPhone" runat="server" Width="60%" Height="30" Font-Size="25px"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>行動電話</label>
                                <asp:TextBox ID="txtMobilePhone" runat="server" Width="60%" Height="30" Font-Size="25px"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>LineID(選填)</label>
                                <asp:TextBox ID="txtLine" runat="server" Width="60%" Height="30" Font-Size="25px"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>公休日(選填)</label>
                                <asp:DropDownList ID="DWHoliday" Font-Size="15px" runat="server" Width="150px">
                                    <asp:ListItem> </asp:ListItem>
                                    <asp:ListItem>星期一</asp:ListItem>
                                    <asp:ListItem>星期二</asp:ListItem>
                                    <asp:ListItem>星期三</asp:ListItem>
                                    <asp:ListItem>星期四</asp:ListItem>
                                    <asp:ListItem>星期五</asp:ListItem>
                                    <asp:ListItem>星期六</asp:ListItem>
                                    <asp:ListItem>星期日</asp:ListItem>
                                    <asp:ListItem>全年無休</asp:ListItem>
                                </asp:DropDownList>
                                <asp:TextBox ID="txtHoliday" runat="server" placeholder="例如:上午公休" Width="60%" Height="30" Font-Size="25px"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>營業時間</label>
                                <asp:DropDownList ID="OpTime1" Font-Size="15px" runat="server">
                                    <asp:ListItem>00:00</asp:ListItem>
                                    <asp:ListItem>00:30</asp:ListItem>
                                    <asp:ListItem>01:00</asp:ListItem>
                                    <asp:ListItem>01:30</asp:ListItem>
                                    <asp:ListItem>02:00</asp:ListItem>
                                    <asp:ListItem>02:30</asp:ListItem>
                                    <asp:ListItem>03:00</asp:ListItem>
                                    <asp:ListItem>03:30</asp:ListItem>
                                    <asp:ListItem>04:00</asp:ListItem>
                                    <asp:ListItem>04:30</asp:ListItem>
                                    <asp:ListItem>05:00</asp:ListItem>
                                    <asp:ListItem>05:30</asp:ListItem>
                                    <asp:ListItem>06:00</asp:ListItem>
                                    <asp:ListItem>06:30</asp:ListItem>
                                    <asp:ListItem>07:00</asp:ListItem>
                                    <asp:ListItem>07:30</asp:ListItem>
                                    <asp:ListItem>08:00</asp:ListItem>
                                    <asp:ListItem>08:30</asp:ListItem>
                                    <asp:ListItem>09:00</asp:ListItem>
                                    <asp:ListItem>09:30</asp:ListItem>
                                    <asp:ListItem>10:00</asp:ListItem>
                                    <asp:ListItem>10:30</asp:ListItem>
                                    <asp:ListItem>11:00</asp:ListItem>
                                    <asp:ListItem>11:30</asp:ListItem>
                                    <asp:ListItem>12:00</asp:ListItem>
                                    <asp:ListItem>12:30</asp:ListItem>
                                    <asp:ListItem>13:00</asp:ListItem>
                                    <asp:ListItem>13:30</asp:ListItem>
                                    <asp:ListItem>14:00</asp:ListItem>
                                    <asp:ListItem>14:30</asp:ListItem>
                                    <asp:ListItem>15:00</asp:ListItem>
                                    <asp:ListItem>15:30</asp:ListItem>
                                    <asp:ListItem>16:00</asp:ListItem>
                                    <asp:ListItem>16:30</asp:ListItem>
                                    <asp:ListItem>17:00</asp:ListItem>
                                    <asp:ListItem>17:30</asp:ListItem>
                                    <asp:ListItem>18:00</asp:ListItem>
                                    <asp:ListItem>18:30</asp:ListItem>
                                    <asp:ListItem>19:00</asp:ListItem>
                                    <asp:ListItem>19:30</asp:ListItem>
                                    <asp:ListItem>20:00</asp:ListItem>
                                    <asp:ListItem>20:30</asp:ListItem>
                                    <asp:ListItem>21:00</asp:ListItem>
                                    <asp:ListItem>21:30</asp:ListItem>
                                    <asp:ListItem>22:00</asp:ListItem>
                                    <asp:ListItem>22:30</asp:ListItem>
                                    <asp:ListItem>23:00</asp:ListItem>
                                    <asp:ListItem>23:30</asp:ListItem>
                                    <asp:ListItem>24:00</asp:ListItem>
                                </asp:DropDownList>-                                       
                                        <asp:DropDownList ID="OpTime2" Font-Size="15px" runat="server">
                                            <asp:ListItem>00:00</asp:ListItem>
                                            <asp:ListItem>00:30</asp:ListItem>
                                            <asp:ListItem>01:00</asp:ListItem>
                                            <asp:ListItem>01:30</asp:ListItem>
                                            <asp:ListItem>02:00</asp:ListItem>
                                            <asp:ListItem>02:30</asp:ListItem>
                                            <asp:ListItem>03:00</asp:ListItem>
                                            <asp:ListItem>03:30</asp:ListItem>
                                            <asp:ListItem>04:00</asp:ListItem>
                                            <asp:ListItem>04:30</asp:ListItem>
                                            <asp:ListItem>05:00</asp:ListItem>
                                            <asp:ListItem>05:30</asp:ListItem>
                                            <asp:ListItem>06:00</asp:ListItem>
                                            <asp:ListItem>06:30</asp:ListItem>
                                            <asp:ListItem>07:00</asp:ListItem>
                                            <asp:ListItem>07:30</asp:ListItem>
                                            <asp:ListItem>08:00</asp:ListItem>
                                            <asp:ListItem>08:30</asp:ListItem>
                                            <asp:ListItem>09:00</asp:ListItem>
                                            <asp:ListItem>09:30</asp:ListItem>
                                            <asp:ListItem>10:00</asp:ListItem>
                                            <asp:ListItem>10:30</asp:ListItem>
                                            <asp:ListItem>11:00</asp:ListItem>
                                            <asp:ListItem>11:30</asp:ListItem>
                                            <asp:ListItem>12:00</asp:ListItem>
                                            <asp:ListItem>12:30</asp:ListItem>
                                            <asp:ListItem>13:00</asp:ListItem>
                                            <asp:ListItem>13:30</asp:ListItem>
                                            <asp:ListItem>14:00</asp:ListItem>
                                            <asp:ListItem>14:30</asp:ListItem>
                                            <asp:ListItem>15:00</asp:ListItem>
                                            <asp:ListItem>15:30</asp:ListItem>
                                            <asp:ListItem>16:00</asp:ListItem>
                                            <asp:ListItem>16:30</asp:ListItem>
                                            <asp:ListItem>17:00</asp:ListItem>
                                            <asp:ListItem>17:30</asp:ListItem>
                                            <asp:ListItem>18:00</asp:ListItem>
                                            <asp:ListItem>18:30</asp:ListItem>
                                            <asp:ListItem>19:00</asp:ListItem>
                                            <asp:ListItem>19:30</asp:ListItem>
                                            <asp:ListItem>20:00</asp:ListItem>
                                            <asp:ListItem>20:30</asp:ListItem>
                                            <asp:ListItem>21:00</asp:ListItem>
                                            <asp:ListItem>21:30</asp:ListItem>
                                            <asp:ListItem>22:00</asp:ListItem>
                                            <asp:ListItem>22:30</asp:ListItem>
                                            <asp:ListItem>23:00</asp:ListItem>
                                            <asp:ListItem>23:30</asp:ListItem>
                                            <asp:ListItem>24:00</asp:ListItem>
                                        </asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <label>信箱</label>
                                <asp:TextBox ID="txtEmail" runat="server" Width="82%" Height="30" Font-Size="25px"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>地區</label>
                                <asp:DropDownList ID="DWCity" Font-Size="15px" runat="server" Width="150px">
                                    <asp:ListItem>台北市</asp:ListItem>
                                    <asp:ListItem>新北市</asp:ListItem>
                                    <asp:ListItem>桃園市</asp:ListItem>
                                    <asp:ListItem>新竹市</asp:ListItem>
                                    <asp:ListItem>新竹縣</asp:ListItem>
                                    <asp:ListItem>苗栗縣</asp:ListItem>
                                    <asp:ListItem>基隆市</asp:ListItem>
                                    <asp:ListItem>台南市</asp:ListItem>
                                    <asp:ListItem>台中市</asp:ListItem>
                                    <asp:ListItem>高雄市</asp:ListItem>
                                    <asp:ListItem>花蓮縣</asp:ListItem>
                                    <asp:ListItem>台東縣</asp:ListItem>
                                    <asp:ListItem>南投縣</asp:ListItem>
                                </asp:DropDownList>
                                <asp:TextBox ID="txtAddress" runat="server" Width="60%" Height="30" Font-Size="25px"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>介紹</label>
                                <asp:TextBox ID="txtDescription" runat="server" Height="150px" Font-Size="20px" TextMode="MultiLine" Width="700" CausesValidation="True"></asp:TextBox>
                                 <div class="succ" style="color:red;font-weight:bold;"> </div>
                                
                                    
                            </div>
                            <div class="form-group">
                                <div class='Acg'>
                                    <asp:Button CssClass="btn btn-info btn-large" ClientID="Button2" ID="Button2" runat="server" OnClick="btnUpDate_Click" Text="更新資料" />
                                </div>
                            </div>
                        </div>
                        <!--左方大DIV結束-->
                        <!--右方小DIV-->
                        <div class="pic">

                            <asp:Image ID="imgPic2" runat="server" onerror="this.src='/img/head.png'" Height="200" Width="170" />                          

                            <asp:FileUpload ID="picUpload" runat="server" />
                            <asp:Button ID="Button1" CssClass="btn btn-info btn-large" runat="server" OnClick="picUpload_Click" Text="上傳" Width="80px" />

                        </div>
                        <!--右方小DIV結束-->


                    </div>

                    <!--個人行事曆開始-->
                    <div class="tab-pane" id="lB">
                        <div class="breadcrumb">
                            <div class="wrap">
                                <div class="container-fluid" style="text-align: left">
                                    <a href="Default.aspx"><i class="icon-home"></i>首頁</a><span>/</span>個人行事曆                 
                                </div>
                            </div>
                        </div>
                        <div id='calendar'></div>
                        <br />

                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                            <ContentTemplate>
                                <span style="color: #ff6a00;">待確認之方案:</span>
                                <asp:DropDownList ID="DropDownList1" runat="server" Style="display: inline-block; margin-left: 1%;" CssClass="form-control span3" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                                <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <!--個人行事曆結束-->
                    <!--我的方案  -->
                    <div class="tab-pane" id="lG"> 
                        <div class="breadcrumb">
                            <div class="wrap">
                                <div class="container-fluid" style="text-align: left">
                                    <a href="Default.aspx"><i class="icon-home"></i>首頁</a><span>/</span>我的方案                 
                                </div>
                            </div>
                        </div>
                        <div style="float: left;">
                            <a class="btn btn-success" href="storeAddServices.aspx">新增方案</a>
                            <a class="btn btn-success" href="storeServicesPic.aspx">更換方案封面</a>
                            <asp:Label ID="Label5" runat="server" Visible="false" Text="資料刪除成功"></asp:Label>
                        </div>
                        <div style="width: 100%; height: 700px; overflow: auto;">
                            <h5>※必須更換方案封面準新人才看的到你的方案喔!</h5>
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    
                                    <asp:DataList ID="DLLMyservices" runat="server" RepeatColumns="3" RepeatDirection="Horizontal" OnItemCommand="DLLMyservices_ItemCommand">
                                        <ItemTemplate>
                                           <div class="thumbnail" style=" border: solid; border-width: 1px; margin-top: 30px; margin-left: 5px;" >
                                                <a href='gallery_2.aspx?fid=<%=id%>&sid=<%# Eval("fnom") %>'>
                                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("fPhoto") %>' Height="250px" Width="300px" />
                                                    <h3>
                                                        <asp:Label ID="lbl1"  Height="80px" runat="server" Width="280px" Text='<%# Eval("fName") %>'></asp:Label></h3>
                                                    <div style="text-align: right">

                                                        <asp:Label ID="Label2" runat="server" Visible="false" Text='<%# Eval("fnom") %>'></asp:Label>
                                                        <asp:Button CssClass="btn btn-default" ID="Button3" CommandName="deleteser" runat="server" Text="刪除此方案" />
                                                    </div>
                                                </a>
                                            </div>
                                            <hr />
                                        </ItemTemplate>
                                    </asp:DataList>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                    <!--我的方案結束-->
                    <!--作品集-->
                    <div class="tab-pane" id="lC">
                        <div class="breadcrumb">
                            <div class="wrap">
                                <div class="container-fluid" style="text-align: left">
                                    <a href="Default.aspx"><i class="icon-home"></i>首頁</a><span>/</span>作品集                 
                                </div>
                            </div>
                        </div>
                        <div style="float: left">
                            <a class="btn btn-success" href="storeAddGallery.aspx">新增作品集</a>
                            <a class="btn btn-success" href="storePhotoCover.aspx">更換作品集封面</a>
                            <a class="btn btn-success" href="storeAddGalleryPhoto.aspx">新增相片</a>
                            <asp:Label ID="Label4" runat="server" Visible="false" Text="資料刪除成功"></asp:Label>
                            </div>
                        <div style="width: 100%; height: 700px; overflow:auto"> 
                           <h5>※必須更換作品集封面準新人才看的到你的方案喔!</h5>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <asp:DataList ID="DataList1" runat="server" RepeatColumns="3" RepeatDirection="Horizontal" OnItemCommand="DataList1_ItemCommand">
                                        <ItemTemplate>
                                            <div class="thumbnail" style=" border: solid; border-width: 1px; margin-top: 30px; margin-left: 5px;" >
                                                <a href='gallery_1.aspx?fid=<%=id %>&amp;gid=<%# Eval("fid") %>'>
                                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("fPhoto") %>' Height="250px" Width="300px" />
                                                    <h3>
                                                        <asp:Label ID="lbl1" Height="80px" runat="server" Text='<%# Eval("fName") %>'></asp:Label></h3>
                                                    <div style="text-align: right;">

                                                        <asp:Label ID="Label2" runat="server" Visible="false" Text='<%# Eval("fnom") %>'></asp:Label>
                                                        <asp:Button CssClass="btn btn-default" ID="Button3" CommandName="delete" runat="server" Text="刪除此作品集" />
                                                    </div>
                                                </a>
                                            </div>
                                            <hr />
                                        </ItemTemplate>
                                    </asp:DataList>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                              
                              
                        </div>
                    </div>
                    <!--作品集End-->
                    <!--訊息開始-->
                    <div class="tab-pane" id="lF">
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
                    <!--訊息結束-->
                    <!--站內信-->
                    <div class="tab-pane" id="lD">
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
                </div>
            </div>
        </div>
    </div>

    <!--站內信-->
</asp:Content>

