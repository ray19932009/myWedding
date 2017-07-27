<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="StoreInfo.aspx.cs" Inherits="StoreInfo" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- 左邊店家資訊 -->

    <style>
        .like1 {
            background-image: url("img/like1.png");
        }

        .like2 {
            background-image: url("img/like2.png");
        }
        .star {
            margin:1%;
            width: 30px;
            height: 35px;
            cursor: default;
            background-repeat: no-repeat;
 
        }
        .fullEmptyStar {
            background-image: url("img/starfull1.png");
        }
        .emptyStar {
            background-image: url("img/starempty1.png");
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
    <div class="row">
    <div class="col-lg-3 col-md-3 hidden-sm hidden-xs" style="float:left;width:400px;">
        <div class="panel panel-default">   
                <div class="media" style="padding:0 50px; float:none;">
                    <div>
                        <center>                      
                           <asp:Image ID="Image1"  runat="server" ImageUrl="~/" width="200px" height="200px" style="margin-top:10%;" />  
                            </center>
                             <h3><strong>
                             <center>      
                            <asp:Label ID="Label1" runat="server" Text="1" Font-Bold="true"></asp:Label></strong></h3>                        
                             </center>

                            
                    </div>
                    <hr />
                    <div class="media-body">
                        <p>
                              
                            <div style="display:inline-block;"><a href="#" data-chat='<%=fid %>' class="btn btn-success btn-large" style="display:inline;">聯絡廠商</a>
                            
                             <a  class="liClickLike" href="#" data-serviceid1='<%=fid %>' style="float:right; ">
                            <img   src="<%=like == Convert.ToInt32(fid)? "img/like1.jpg":"img/like4.jpg" %>" style="<%=islogin%> width:150px;height:50px; " />
                             </a>
                                </div>
                         <%--    
                            <img src="img/starfull.png" style="<%=islogin%>" />--%>
                            
                        </p>
                      
                        <br />
                 <%--       <div style="float:left;margin:1%;" >--%>
                            <ajaxToolkit:Rating ID="Rating1" runat="server"
                                StarCssClass="star"
                                WaitingStarCssClass="fullEmptyStar"
                                EmptyStarCssClass="emptyStar"
                                FilledStarCssClass="fullEmptyStar"
                                ReadOnly="true">
                            </ajaxToolkit:Rating>
                            <%--    </div>--%>
 
                       <%--  <div style="float:right;margin:10%;">--%>
                            <asp:Label ID="Label9" runat="server" Text="Label9" Font-Size="Small"></asp:Label>
                     <%--   </div>--%>
 
                        <hr />
                     
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
     
    <!-- 右邊資訊 -->

                   

    <div class="tz-gallery" style="float:left;margin-left:30px;width:1200px;">
        <div class="row">
            <div style="margin:20px;font-size:18px;"><a href="Default.aspx"><i class="icon-home"></i>首頁</a><span>/</span>廠商資訊</div>
            <div class="col-md-9" >
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
                                       <div class="thumbnail" style="margin-right: 20px">
                                            <div class="span3 element category01" data-category="category01" style="margin-left: 20px;">
                                                    <table class="nav-justified">
                                                        <tr>
                                                            <td>
                                                                <a href='gallery_1.aspx?fid=<%# Eval("fIdStores")%>&amp;gid=<%# Eval("fIdGallery") %>'>
                                                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("fPhoto") %>' Height="150px" style="background-size:contain;" />
                                                                </a></td>

                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <div style="margin: 2%; border-radius: 10px; background-color: antiquewhite; padding: 5%;">
                                                                    <table class="nav-justified">
                                                                        <tr>
                                                                            <td>
                                                                                <asp:Label ID="Label15" runat="server" Font-Names="微軟正黑體" Font-Size="Large" Style="font-weight: bold;" Text='<%# Eval("fName") %>'></asp:Label>
                                                                            </td>
                                                                            <td>&nbsp;</td>
                                                                        </tr>
                                                                 
                                                                        <tr>
                                                                            <td>
                                                                                <asp:Label ID="Label18" runat="server" Font-Names="微軟正黑體" Font-Size="X-Small" ForeColor="#999999" Text='<%# Eval("fDescription") %>'></asp:Label>
                                                                            </td>
                                                                            <td>&nbsp;</td>
                                                                        </tr>

                                                                        <tr>

                                                                            <td>
                                                                                <hr style="margin: 0 0 10px 0; padding: 0;" />
                                                                                <a href='StoreInfo.aspx?fid=<%# Eval("fIdStores") %>'>
                                                                                    <asp:Image ID="Image5" runat="server" Height="32px" ImageUrl='<%# Eval("memberPhoto") %>' Style="border-radius: 43px; display: inline-block; width: 32px;" />
                                                                                    <asp:Label ID="Label6" runat="server" Font-Bold="true" Text='<%# Eval("memberName") %>'></asp:Label>
                                                                               </a>              
                                                                            </td>
                                                                            <td>&nbsp;</td>
                                                                        </tr>
                                                                    </table>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </div>
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
                                     <div class="thumbnail" style="margin-right: 20px">
                                                <div class="span3 element category01" data-category="category01" style="margin-left: 20px;">
                                                    <table class="nav-justified">
                                                        <tr>
                                                            <td>
                                                                <a href='gallery_2.aspx?fid=<%# Eval("fIdStores") %>&amp;sid=<%# Eval("fIdServices") %>'>
                                                                <asp:Image ID="Image3" runat="server"  ImageUrl='<%# Eval("fPhoto") %>' Width="250px" Height="150px"/>
                                                                </a></td>

                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <div style="margin:2%;border-radius:10px; background-color:antiquewhite; padding:5%;">
                                                                <table class="nav-justified">
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label ID="Label15" runat="server" Font-Names="微軟正黑體" Font-Size="Large" style="font-weight:bold;" Text='<%# Eval("fName") %>'></asp:Label>
                                                                        </td>
                                                                        <td>&nbsp;</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label ID="Label16" runat="server" Font-Names="微軟正黑體" Font-Size="Large" style="font-weight:bold;" CssClass="title_t" Text='<%# "<a>NT$"+Eval("fMaxMoney")+"</a>" %>'></asp:Label>
                                                                        </td>
                                                                        <td>&nbsp;</td>
                                                                       
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label ID="Label18" runat="server" Font-Names="微軟正黑體" Font-Size="X-Small" ForeColor="#999999" Text='<%# Eval("fDescription") %>'></asp:Label>
                                                                        </td>
                                                                        <td>&nbsp;</td>
                                                                    </tr>
                                                                    
                                                                    <tr>
                                                                     
                                                                        <td>    <hr style="margin:0 0 10px 0;padding:0;" /><a href='StoreInfo.aspx?fid=<%# Eval("fIdStores") %>'>
                                                                            <asp:Image ID="Image5" runat="server" Height="32px" ImageUrl='<%# Eval("StorePhoto") %>' Style="border-radius: 43px; display:inline-block;width:32px;" />
                                                                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("StoreName") %>'></asp:Label>
                                                                            
                                                                            </a></td>
                                                                        <td>&nbsp;</td>
                                                                    </tr>
                                                                </table>
                                                                 </div>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>


                                            </div>
                                    </div>
                                </ItemTemplate>
                            </asp:DataList>

                        </div>
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