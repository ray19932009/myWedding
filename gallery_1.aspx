<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="gallery_1.aspx.cs" Inherits="gallery_1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 71px;

        }
        .fancybox-custom .fancybox-skin {
			box-shadow: 0 0 50px #222;
		}
        .auto-style2 {

            position: relative;
            min-height: 1px;
            width: 100%;
            text-align: center;
            padding-left: 15px;
            padding-right: 15px;
        }
    </style>
    <link href="css/Li-Gallery_1.css" rel="stylesheet" />
    <link href="css/Li-StoreInfo.css" rel="stylesheet" />
    <link href="fancybox-2.1.7/source/jquery.fancybox.css" rel="stylesheet" media="screen"/>
    <link href="fancybox-2.1.7/source/helpers/jquery.fancybox-thumbs.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    
    <!-- Add jQuery library -->
 


<!-- 上方menu -->
      <div class="container">
        <div class="row">
            <a href="Default.aspx"><asp:Label ID="Label1" runat="server" Text="首頁"></asp:Label></a>
            &nbsp;>&nbsp;
            <a href='StoreInfo.aspx?fid=<%=fid %>'>
            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></a>
            &nbsp;>&nbsp;      
            <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
        </div>
      </div>
 <!-- 上方menu / -->
 <!-- 上方灰色 -->
    
    <div class="container">
        <div class="row">
            <div class="breadcrumbLi">
			    <table class="nav-justified" >
                    <tr>
                        <td class="auto-style1"> <a><asp:Image ID="img_TopNavi" runat="server" Style="border-radius: 43px;width:80px;height:80px"/></a></td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp; <a><asp:Label ID="lbl_TopNavi" runat="server" Text="Label"></asp:Label></a></td>
                    </tr>
                    </table>
            </div>      
       </div>
    </div>         
   
 <!-- 上方灰色 /-->
 <!-- 中間圖片 /-->
    <div style="border:3.5px solid pink; margin:2% 8% 2% 8%; border-radius:15px;">
    <div class="container gallery-container">
    <h1><asp:Label ID="lblName" runat="server" Text="Label"></asp:Label></h1>
    <p class="page-description text-center">
        <asp:Label ID="lblDescription" runat="server" Text="Label"></asp:Label></p>  

       
    <div class="tz-gallery" style="padding:2%;">
        <div class="row">
            <div class="auto-style2" align="center" >
                 <asp:DataList ID="DataList_gallery1" runat="server" RepeatDirection="Horizontal" RepeatColumns="5" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center">
                    <ItemTemplate>
                       <div style="margin:15px 15px 15px 15px">
                         <a href='<%# Eval("fPhoto") %>'  class="fancybox-thumbs" data-fancybox-group="thumb" >
                         <img src='<%# Eval("fPhoto") %>'   style="background-size:contain;Height:150px;" class="shadowLi" />
                        </a>
                        </div>
                     </ItemTemplate>
                 </asp:DataList>     
            </div>
        </div>
    </div>
</div>
    </div>
<hr />

 <!-- Tab panes -->
            <div class="tz-gallery">
                    <div class="container gallery-container">
                        <p class="page-description text-center">更多作品集</p>
                             <div class="tz-gallery">
                                <div class="row">
                                    <div class="col-md-12" >
                            <asp:DataList ID="DataList1" runat="server" RepeatDirection="Horizontal" RepeatColumns="4">
                                <ItemTemplate>
                                   <div class="thumbnail" style="margin-right: 20px">
                                                <div class="span3 element category01" data-category="category01" style="margin-left: 20px;overflow: hidden;" >
                                                    <div class="hover_img">
                                                        <a href='gallery_1.aspx?fid=<%# Eval("fIdStores")%>&amp;gid=<%# Eval("fIdGallery") %>'>
                                                        <asp:Image ID="Image3" runat="server" ImageUrl='<%# Eval("fPhoto") %>' style="background-size:contain;" Height="150px"/>
                                                            </a>
                                                    </div>
                                                    <div class="item_description">
                                                        <h6><a href="StoreInfo.aspx?fid=<%# Eval("fIdStores") %>">
                                                            <asp:Label ID="fNameLabel" runat="server" Text='<%# Eval("fName") %>' />
                                                        </a></h6>
                                                        <div class="descr">
                                                            <asp:Label ID="fDescriptionLabel" runat="server" Text='<%# Eval("fDescription") %>' />
                                                        </div>
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

</asp:Content>
