<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="storeAddGalleryPhoto.aspx.cs" Inherits="storeAddServices" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="css/newAndStores.css" rel="stylesheet" />
    <style>
        .well ul {
            width: 100%;
            list-style-type: none;
        }

        .datepicker {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--內容-->
    <div class="breadcrumb" style="margin: 0 15% 5px 15%">
        <div class="wrap">
            <div class="container-fluid">
                <a href="Default.aspx"><i class="icon-home"></i>首頁</a><span>/</span>上傳相片
                 
            </div>
        </div>
    </div>

    <div style="padding: 0 10% 0 10%">
        <div class="tabbable tabs-left colinfont">
            <div class="col-lg-3 col-md-3 ">
                <div class="panel panel-default" style="border: none">
                    <div style="height: 500px">
                        <div class="media">
                            <div>                               
                                <center> 
                                    <asp:Image ID="imgPic" runat="server"  onerror="this.src='/img/head.png'" Height="300" Width="250" /></center>
                                <br />
                                <center>店名:<asp:Label ID="lblUserName" runat="server" Text="名子" Font-Bold="True" ForeColor="Black"></asp:Label></center>
                                 <div style="float:right">
                                    <asp:HyperLink ID="HyperLink1" class="btn btn-success btn-lg2 " runat="server" NavigateUrl="~/memberCenter_Store.aspx">回會員中心</asp:HyperLink>
                                <asp:HyperLink ID="HyperLink2" class="btn btn-success btn-lg2 " runat="server" NavigateUrl="~/storeAddGallery.aspx">新增作品集</asp:HyperLink>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div>

                <asp:Label ID="Label1" runat="server" Text="選擇要上傳的作品集"></asp:Label>
                <asp:DropDownList ID="DWPhoto" runat="server">
                </asp:DropDownList>
                <asp:FileUpload ID="picUpload" AllowMultiple="True" runat="server" />
                <asp:Button ID="Button1" runat="server" Text="確定上傳" OnClick="Button1_Click" />
                <asp:Label ID="Label4" runat="server" Font-Bold="True" ForeColor="Red" Text="Label" Visible="False"></asp:Label>
                <h5 style="color:dimgray">※可以多選多張帳片,總大小不可超過150M</h5>
            </div>
            <div class="tab-content colintabcontent">
                <div class="container" style="width: 100%; padding: 0;">
                    <div class="well" style="margin: 0 0 0 0; height: 600px; overflow-y: scroll">
                        <!--上傳相簿預覽-->
                        <div style="overflow-x:hidden">
                        <asp:DataList ID="DataList1" runat="server" RepeatColumns="3" RepeatDirection="Horizontal" Width="100%">
                            <ItemTemplate>
                                <div style="margin: 0 0 10px 10px;">
                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("fphoto") %>' Height="200px" Width="300px" />
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
                            </div>
                        <!--上傳相簿預覽結束-->
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

