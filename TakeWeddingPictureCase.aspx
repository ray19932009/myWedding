<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="TakeWeddingPictureCase.aspx.cs" Inherits="TakeWeddingPicture" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
   
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <style>
        .star {
            width: 30px;
            height: 30px;
            cursor: default;
            background-repeat: no-repeat;
       
           
        }

        .fullEmptyStar {
            background-image: url("img/starfull.png");
        }

        .emptyStar {
            background-image: url("img/starempty.png");
        }
    </style>


    <!--拍婚紗內容-->
    <div class="page_container" style="background-color: rgba(0, 0, 0, 0.00);">
        <div class="breadcrumb">
            <div class="wrap">
                <div class="container-fluid">
                    <a href="Default.aspx"><i class="icon-home"></i>首頁</a><span>/</span>拍婚紗
                </div>
            </div>
        </div>
        <!--MAIN CONTENT AREA-->
        <div class="wrap">
            <div class="container inner_content">
                <div id="options">
                    <ul id="filters">
                        <li><a href="TakeWeddingPicture.aspx?subClass=0" class="btn dark_btn ">
                            <asp:Label ID="Label4" runat="server" Text="作品集" Font-Size="20px"  Height="100%" Width="100%"></asp:Label></a></li>
                        &nbsp;&nbsp;
                        <li style="margin-right: 70%"><a href="TakeWeddingPictureCase.aspx?subClass=0" class="btn dark_btn liselected">
                            <asp:Label ID="Label5" runat="server" Text="方案" Font-Size="20px"  Height="100%" Width="100%"></asp:Label></a></li>
                           <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" EnableViewState="false" AutoPostBack="True" Width="186px" CssClass="btn btn-large" Height="100%">
                            <asp:ListItem Value="1">更新時間&#11015;</asp:ListItem>
                            <asp:ListItem Value="2">人氣&#11015;</asp:ListItem>                     
                            </asp:DropDownList>
                    </ul>
                    <ul id="filters"  >
                         
                        <asp:Label ID="Label3" runat="server" Text=""  ></asp:Label>
                       
                    </ul>
                    <div class="clear"></div>
                </div>

                <!-- portfolio_block -->
                <div class="tz-gallery1">
                    <div class="container gallery-container">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="projects">

                                    <asp:DataList ID="DataList1" runat="server" DataKeyField="fIdGallery" RepeatDirection="Horizontal" RepeatColumns="4" OnItemCommand="DataList1_ItemCommand" OnItemDataBound="DataList1_ItemDataBound">
                                        <ItemTemplate>
                                            <div class="thumbnail" style="margin-right: 20px">
                                                <div class="span3 element category01" data-category="category01" style="margin-left: 20px;">
                                                    <table class="nav-justified">
                                                        <tr>
                                                            <td>
                                                                    <a href='gallery_2.aspx?fid=<%# Eval("fIdStores") %>&amp;sid=<%# Eval("fIdServices") %>'>
                                                                    <asp:Image ID="Image3" runat="server" ImageUrl='<%# Eval("fPhoto") %>' style="background-size:contain;" Height="150px" />
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
                                                                                <asp:Label ID="Label16" runat="server" Font-Names="微軟正黑體" Font-Size="Large" Style="font-weight: bold;" CssClass="title_t" Text='<%# "<a>NT$"+Eval("fMaxMoney")+"</a>" %>'></asp:Label>
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
                                                                                    <asp:Image ID="Image5" runat="server" Height="32px" ImageUrl='<%# Eval("StorePhoto") %>' Style="border-radius: 43px; display: inline-block; width: 32px;" />
                                                                                    <asp:Label ID="Label6" runat="server" Font-Bold="true" Text='<%# Eval("StoreName") %>'></asp:Label>
                                                                                </a>
                                                                                <hr style="margin: 10px 0 10px 0; padding: 0;" />
                                                                                <div style="float:left">
                                                                                <a data-colinserviceid="<%#Eval("fIdServices") %>" data-colinstoreid="<%# Eval("fIdStores")%>" href="#" class="colinchooseservices btn btn-info">我要選此方案</a>
                                                                                    <asp:Label ID="Label19"  Visible="false" runat="server" Text='<%# Eval("fIdServices") %>'></asp:Label>
                                                                                </div>
                                                                               
                                                                                <div style="float:right">
                                                                            
                                                                                        <a class="liClickStar" href="#" data-serviceid='<%# Eval("fIdServices") %>'>

                                                                                        <img src="<%#star.Contains(Convert.ToInt32(Eval("fIdServices")) )? "img/starfull.png":"img/starempty.png" %>" style="<%# islogin? "display:block":"display:none" %>" />
                                                                                  </a>
                                                                                </div>
                                                                              
                                                                                 
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
                                        </ItemTemplate>
                                    </asp:DataList>

                                </div>

                            </div>
                        </div>
                    </div>
                </div>

                <div class="clear">
                </div>

                <!-- //portfolio_block -->
            </div>
        </div>
    </div>
    <!--//MAIN CONTENT AREA-->
    <div align="center">
      
          <nav>
        <ul class="pager">
         <li><asp:LinkButton ID="lkfirst" runat="server" OnCommand="IndexChanging" CommandArgument="first">第一頁</asp:LinkButton></li>

      
        <li>&nbsp;&nbsp;<asp:LinkButton ID="lkPre" OnCommand="IndexChanging" CommandArgument="pre" runat="server" >上一頁</asp:LinkButton></li>

         <li > <asp:Label ID="Label1" runat="server" ForeColor="DimGray"></asp:Label></li>
      
      
       <%-- <li> <asp:Label ID="Label2" runat="server"  ForeColor="DimGray" ></asp:Label></li>--%>
       

        <li><asp:LinkButton ID="lkNext" OnCommand="IndexChanging" CommandArgument="next" runat="server">下一頁</asp:LinkButton></li>

        &nbsp;
        
        <li><asp:LinkButton ID="lklast" OnCommand="IndexChanging" CommandArgument="last" runat="server">最後一頁</asp:LinkButton></li>
        </ul>
       </nav>
        <!--//page_container-->
    </div>
</asp:Content>
