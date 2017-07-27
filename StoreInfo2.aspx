<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="StoreInfo2.aspx.cs" Inherits="StoreInfo" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- 左邊店家資訊 -->

    <style>
        .star {
            width: 30px;
            height: 75px;
            cursor: default;
            background-repeat: no-repeat;
            display: block;
        }
        .fullEmptyStar {
            background-image: url("img/starfull.png");
        }
        .emptyStar {
            background-image: url("img/starempty.png");
        }
        .auto-style1 {
            height: 20px;
        }
        .auto-style2 {
            height: 18px;
        }
        .auto-style3 {
            height: 18px;
            text-align: right;
        }
        .auto-style4 {
            height: 16px;
        }
        .auto-style7 {
            width: 28px;
        }
        .auto-style8 {
            height: 16px;
            width: 28px;
        }
        .auto-style9 {
            font-size: large;
        }
        .auto-style10 {
            height: 23px;
        }
    </style>
    <link href="css/Li-StoreInfo.css" rel="stylesheet" />

    <div class="col-lg-3 col-md-3 hidden-sm hidden-xs">
        <div class="panel panel-default">
            <div class="panel1-body">
                <div class="media">
                    <div>
                        <center>                      
                           <asp:Image ID="Image1"  runat="server" ImageUrl="~/" width="200px" height="200px" />  
                            </center>

                    </div>
                    <hr />
                    <div class="media-body">
                        <p>
                            <center><a href="#" data-chat='<%=fid %>' class="btn btn-success btn-large">聯絡廠商</a></center>
                        </p>
                        <br />
                        <p>
                            <ajaxToolkit:Rating ID="Rating1" runat="server"
                                StarCssClass="star"
                                WaitingStarCssClass="fullEmptyStar"
                                EmptyStarCssClass="emptyStar"
                                FilledStarCssClass="fullEmptyStar"
                                ReadOnly="true">
                            </ajaxToolkit:Rating>
                            <br />
                            <asp:Label ID="Label9" runat="server" Text="Label9" Font-Size="Small"></asp:Label>
                        </p>
                        <hr />
                        <h3><strong>
                            <asp:Label ID="Label1" runat="server" Text="1"></asp:Label></strong></h3>
                        <p>
                            <asp:Label ID="Label2" runat="server" Text="storeDescription"></asp:Label></p>
                        <hr />
                        <h3><strong>
                            <asp:Label ID="Label3" runat="server" Text="Label">地址</asp:Label></strong></h3>
                        <p>
                            <asp:Label ID="Label4" runat="server" Text="2"></asp:Label></p>
                        <hr />
                        <h3><strong>
                            <asp:Label ID="Label5" runat="server" Text="Label">LineID</asp:Label></strong></h3>
                        <p>
                            <asp:Label ID="Label6" runat="server" Text="3"></asp:Label></p>
                        <hr />
                        <h3><strong>
                            <asp:Label ID="Label7" runat="server" Text="Label">E-mail</asp:Label></strong></h3>
                        <p>
                            <asp:Label ID="Label8" runat="server" Text="4"></asp:Label></p>
                        <hr />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 右邊資訊 -->

    <div class="tz-gallery">
        <div class="row">
            <div class="col-md-9">
                <div class="tab" role="tabpanel">
                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation" class="active" style="column-width: 50px"><a href="#Section1" aria-controls="home" role="tab" data-toggle="tab" style="font-size: large">作品</a></li>
                        <li role="presentation" style="column-width: 50px"><a href="#Section2" aria-controls="profile" role="tab" data-toggle="tab" style="font-size: large">方案</a></li>
                    </ul>
                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane fade in active" id="Section1">
                            <div id="options">
                                <br />
                                <asp:DataList ID="DataList1" runat="server" RepeatDirection="Horizontal" RepeatColumns="4">
                                    <ItemTemplate>
                                        <div class="thumbnail" style="margin-right: 15px">
                                            <table class="nav-justified">
                                                <tr>
                                                    <td colspan="2"><a href='gallery_1.aspx?fid=<%=fid %>&amp;gid=<%# Eval("fIdGallery") %>'>
                                                        <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("fPhoto") %>' />
                                                    </a></td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style1"></td>
                                                    <td class="auto-style1"></td>
                                                </tr>
                                                <tr>
                                                    <td class="text-left">&nbsp; <a href='gallery_1.aspx?fid=<%=fid %>&amp;gid=<%# Eval("fIdGallery") %>'>
                                                        <asp:Label ID="lbl1" runat="server" Font-Names="微軟正黑體" Font-Size="Large" ForeColor="Black" Text='<%# Eval("fName") %>'></asp:Label>
                                                    </a></td>
                                                    <td>&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style1"></td>
                                                    <td class="auto-style1"></td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style2">&nbsp; <a href='gallery_1.aspx?fid=<%=fid %>&amp;gid=<%# Eval("fIdGallery") %>'>
                                                        <asp:Label ID="lbl2" runat="server" EnableTheming="False" Font-Bold="False" Font-Names="微軟正黑體" Font-Size="X-Small" ForeColor="#999999" Text='<%# Eval("fDescription") %>'></asp:Label>
                                                    </a></td>
                                                    <td class="auto-style3">
                                                        <%--<asp:Label ID="Label14" runat="server" Font-Names="微軟正黑體" Font-Size="X-Small" Text='<%# Eval("count") %>'></asp:Label>--%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </ItemTemplate>
                                </asp:DataList>

                            </div>
                        </div>
                        <!-- Section2 -->
                        <div role="tabpanel" class="tab-pane fade" id="Section2">
                            <br />
                            <asp:DataList ID="DataList2" runat="server" RepeatDirection="Horizontal" RepeatColumns="4">
                                <ItemTemplate>
                                    <div class="thumbnail" style="margin-right: 15px">
                                        <table class="nav-justified">
                                            <tr>
                                                <td class="auto-style4" colspan="2">
                                                    <asp:Label ID="Label15" runat="server" Font-Names="微軟正黑體" Font-Size="Large" Text='<%# Eval("fName") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style10" colspan="2"><span class="auto-style9">NT$</span>
                                                    <asp:Label ID="Label16" runat="server" Font-Names="微軟正黑體" Font-Size="Large" ForeColor="#FF3399" Text='<%# Eval("fMaxMoney") %>'></asp:Label>
                                                    ~<asp:Label ID="Label17" runat="server" Font-Names="微軟正黑體" Font-Size="Large" ForeColor="#FF3399" Text='<%# Eval("fMinMoney") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <hr />
                                            <tr>
                                                <td class="auto-style8"></td>
                                                <td class="auto-style4"></td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style4" colspan="2">
                                                    <asp:Label ID="Label18" runat="server" Font-Names="微軟正黑體" Font-Size="X-Small" ForeColor="#999999" Text='<%# Eval("fDescription") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style8"></td>
                                                <td class="auto-style4"></td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style4" colspan="2">
                                                    <a href='gallery_2.aspx?fid=<%=fid %>&amp;sid=<%# Eval("fIdServices") %>'>
                                                        <asp:Image ID="Image3" runat="server" ImageUrl='<%# Eval("fPhoto") %>' />
                                                    </a>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td class="auto-style7" rowspan="2">
                                                    <a href='gallery_2.aspx?fid=<%=fid %>&amp;sid=<%# Eval("fIdServices") %>'>
                                                        <asp:Image ID="Image4" runat="server" ImageUrl='<%# Eval("fMemberPhoto") %>' Style="border-radius: 43px;" />
                                                    </a>
                                                </td>
                                                <td class="auto-style4">
                                                    <a href='gallery_2.aspx?fid=<%=fid %>&amp;sid=<%# Eval("fIdServices") %>'>
                                                        <asp:Label ID="Label19" runat="server" Font-Names="微軟正黑體" Font-Size="Small" ForeColor="Black" Text='<%# Eval("fMemberName") %>'></asp:Label>
                                                    </a>
                                                </td>
                                            </tr>

                                        </table>
                                    </div>
                                </ItemTemplate>
                            </asp:DataList>

                        </div>
                    </div>


                </div>
            </div>
        </div>
    </div>



    <!-- 右邊資訊 -->
    <%--<div class="container">
    <div class="row">
        <div class="col-md-9">
            <div class="tab" role="tabpanel">
                <!-- Nav tabs -->
                <ul class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active" style="column-width:50px"><a href="#Section1" aria-controls="home" role="tab" data-toggle="tab" style="font-size:large">作品</a></li>
                    <li role="presentation" style="column-width:50px" ><a href="#Section2" aria-controls="profile" role="tab" data-toggle="tab" style="font-size:large">方案</a></li>                 
                </ul>
                <!-- Tab panes -->
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane fade in active" id="Section1">
                         <div id="options">
                            <asp:DataList ID="DataList1" runat="server" RepeatDirection="Horizontal" RepeatColumns="2">
                                <ItemTemplate>
                                       <div style="margin:5px;">
                                    <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("fPhoto") %>'/>
                                       </div>
                                </ItemTemplate>
                             </asp:DataList>      
                    </div>
                </div>                    
                    <div role="tabpanel" class="tab-pane fade" id="Section2">
                       <asp:DataList ID="DataList2" runat="server"></asp:DataList>                       
                    </div>                
                </div>
            </div>
        </div>
    </div>
</div>--%>
</asp:Content>