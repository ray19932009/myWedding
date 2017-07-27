<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="storeAddGallery.aspx.cs" Inherits="storeAddServices" %>

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

    <div style="padding: 0 10% 0 10%">
        <div class="tabbable tabs-left colinfont">
            <div class="col-lg-3 col-md-3 ">
                <div class="panel panel-default" style="border: none">
                    <div style="height: 500px">
                        <div class="media">
                            <div>
                                <%--<img class="thumbnail img-responsive" src="https://pic.marry.com.tw/2016/08/23/1430/2017/06/19/trim_149783566001148700_450x300.jpg" width="300px" height="300px">--%>
                                <center> 
                                    <asp:Image ID="imgPic" runat="server"  onerror="this.src='/img/head.png'" Height="300" Width="250" /></center>
                                <br />
                                <center>廠商名:<asp:Label ID="lblUserName" runat="server" Text="名子" Font-Bold="True" ForeColor="Black"></asp:Label></center>
                                <br />
                                <div style="float: right">
                                    <asp:HyperLink ID="HyperLink1" class="btn btn-success btn-lg2 " runat="server" NavigateUrl="~/memberCenter_Store.aspx">回會員中心</asp:HyperLink>
                                    <asp:HyperLink ID="HyperLink3" class="btn btn-success btn-lg2 " runat="server" NavigateUrl="~/storeAddServices.aspx">增加服務</asp:HyperLink>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-content colintabcontent">
                <div class="container" style="width: 100%; padding: 0;">
                    <div class="well" style="margin: 0 0 0 0; text-align: left; padding-left: 100px">
                        <!--建立相簿-->
                        作品集名稱:
                        <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;
                        所屬服務:
                        <asp:DropDownList ID="DWServices" runat="server">
                        </asp:DropDownList>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtname" ErrorMessage="作品集名稱不可為空" Font-Size="12pt" ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        作品集介紹:
                        <asp:TextBox ID="txtDescription" runat="server" Width="62%"></asp:TextBox>


                        <br />


                        <asp:Button ID="Button1" class="btn btn-success" runat="server" Text="建立" OnClick="Button1_Click" />
                        <!--建立新相簿結束-->
                        &nbsp;&nbsp;&nbsp;
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtDescription" ErrorMessage="作品集簡介不可為空" Font-Size="12pt" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:Label ID="Label4" runat="server" ForeColor="Red" Text="作品集新增成功" Visible="False"></asp:Label>
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button2" class="btn btn-success" runat="server" Visible="false" Text="立刻為作品集新增圖片" PostBackUrl="~/storeAddGalleryPhoto.aspx" />
                    </div>
                </div>
            </div>
        </div>
    </div>



</asp:Content>

