<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="舊店.aspx.cs" Inherits="memberCentre_Store" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <link href="css/newAndStores.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--會員中心內容 廠商-->
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
            <li><a href="#lB" data-toggle="tab">個人行事曆</a></li>
            <li><a href="#lC" data-toggle="tab">我的作品</a></li>
            <li><a href="#lD" data-toggle="tab">站內信</a></li>
        </ul>
        <div class="tab-content colintabcontent" style="width:55%">
            <div class="tab-pane active" id="lE">
                <div class="aa">
                    <div class="a1">
                        <p>有幾條新訊息</p>
                    </div>
                    <div class="a2">
                        <p>我最近的留言(有幾個)</p>
                    </div>
                    <div class="a3">
                        <p>專屬行事曆 有幾個配對好的</p>
                    </div>

                </div>
            </div>
            <div class="tab-pane" id="lA">
                <!--左方大DIV-->
                <div >
                    <ul class="center">
                        <li>
                            <label>廠商名</label>
                            <asp:TextBox ID="txtStore" runat="server" Width="210px"></asp:TextBox>
                        </li>
                        <li>
                            <label>電話</label>
                            <asp:TextBox ID="txtPhone" runat="server" Width="210px"></asp:TextBox>
                            &nbsp;</li>
                        <li>
                            <label>行動電話</label>
                            <asp:TextBox ID="txtMobilePhone" runat="server" Width="210px"></asp:TextBox>
                            &nbsp;</li>
                        <li>
                            <label>信箱</label>
                            <asp:TextBox ID="txtEmail" runat="server" Width="350px"></asp:TextBox>
                            &nbsp;</li>
                        <li>
                            <label>地址</label>
                            <asp:TextBox ID="txtAddress" runat="server" Width="450px"></asp:TextBox>
                            &nbsp;</li>

                        <li>
                            <label>介紹</label>
                            <asp:TextBox ID="txtDescription" runat="server" Height="200px" TextMode="MultiLine" Width="550px" CausesValidation="True"></asp:TextBox>
                            &nbsp;</li>

                        <asp:ImageButton ID="ImageButton1" runat="server" OnClick="btnUpDate_Click" ToolTip="更新資料" ImageUrl="~/img/update.png" Height="80px" Width="80px" />
                    </ul>
                </div>
                <!--左方大DIV結束-->
                <!--右方小DIV-->
                <div class="pic">

                    <asp:Image ID="imgPic2" runat="server"  onerror="this.src='/img/head.png'"  Height="200" Width="170" />
                    <ul style="list-style-type: none; color: red">
                        <li>
                            <asp:Label ID="lblPic" runat="server" Text="尚未選擇頭像"></asp:Label></li>
                    </ul>
                    <asp:FileUpload ID="picUpload" runat="server" />
                    <asp:Button ID="Button1" runat="server" OnClick="picUpload_Click" Text="上傳" Width="80px" />
                </div>
                <!--右方小DIV結束-->


            </div>
            <!--個人行事曆開始-->
            <div class="tab-pane" id="lB">

                <div>
                    <p>個人行事曆</p>
                </div>
            </div>
            <!--個人行事曆結束-->
            <!--作品集-->
             <div class="tab-pane" id="lC" style="height:500px">

                 <asp:DataList ID="DataList1" runat="server" CellSpacing="10" RepeatColumns="4" RepeatDirection="Horizontal">
            <ItemTemplate>
                <div style="text-align:center">
                    <br />
                <asp:Label ID="Label1" runat="server"  Height="16px" Width="203px" Text='<%# Eval("fName") %>' Font-Bold="true"></asp:Label>
                    </div>
               
                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("fPhoto") %>' Height="152px" Width="251px" />
                <br />
            </ItemTemplate>
        </asp:DataList>
            </div>
            <!--作品集-->
            <!--站內信-->
            <div class="tab-pane" id="lD">

                
                    <div class="lettercontent container" >
                        <asp:Label ID="lblLetter" runat="server" Text=""></asp:Label>
                    </div>
               
            </div>
           
            <!--站內信-->

        </div>
    </div>
</asp:Content>
