<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="gallery_2.aspx.cs" Inherits="gallery_2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/Li-StoreInfo.css" rel="stylesheet" />
    
    <!-- 習大大縮小 -->
    <style type="text/css">  
        .auto-style2 {
            width: 10px;
        }
        .auto-style1 {
            width: 71px;
        }
    </style>
    <!-- 習大大縮小 /-->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

  <!-- 上方menu -->
      <div class="container" >
        <div class="row">
            <a href="Default.aspx"><asp:Label ID="lbl_Menu_first" runat="server" Text="首頁"></asp:Label></a>
            &nbsp;>&nbsp;
            <a href='StoreInfo.aspx?fid=<%=fid %>'>
            <asp:Label ID="lbl_Menu_second" runat="server" Text="Label"></asp:Label></a>
            &nbsp;>&nbsp;       
            <asp:Label ID="lbl_Menu_third" runat="server" Text="Label"></asp:Label>
        </div>
      </div>
 <!-- 上方灰色 -->
    <div class="container">
        <div class="row">
            <div class="breadcrumbLi">
			    <table class="nav-justified" >
                    <tr>
                        <td class="auto-style1"> <a><asp:Image ID="img_TopNavi" runat="server" Style="border-radius: 43px;width:80px;height:80px" /></a></td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp; <a><asp:Label ID="lbl_TopNavi" runat="server" Text="Label"></asp:Label></a></td>
                    </tr>
                    </table>
            </div>      
       </div>
    </div>         
   
 <!-- 上方灰色 -->


 <div class="container gallery-container">
    <h1><asp:Label ID="lblName" runat="server" Text="Label"></asp:Label></h1>
    <p class="page-description text-center">
        <asp:Label ID="lblMax" runat="server" Text="Label" Font-Names="微軟正黑體" Font-Size="Large" ForeColor="#FF3399"></asp:Label></p>

     <p class="page-description text-center">方案內容</p>
     <div style="margin:0 20%;font-size:18px;font-weight:bold;">
     <p><asp:Label ID="lblContent" runat="server" Text="Label"></asp:Label></p>
     </div>
 </div>
<!-- 中間圖片 -->
      <div style="border:3.5px solid pink; margin:2% 8% 2% 8%; border-radius:15px;">

     <p class="page-description text-center">參考作品</p>
    <div class="tz-gallery">
        <div class="row">
            <div class="col-md-12">
                 <asp:DataList ID="DataList_case_gallery" runat="server" RepeatColumns="5" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center">
                    <ItemTemplate>
                       <div style="margin:15px 15px 15px 15px">
                           <asp:Image ID="Image5" runat="server" ImageUrl='<%# Eval("fPhoto") %>' class="shadowLi" />
                           <br />
                        </a>
                        </div>
                     </ItemTemplate>
                 </asp:DataList>     
            </div>
        </div>
    </div>
</div>

<hr />

<!-- Tab panes -->
                    <div class="container gallery-container">
                        <p class="page-description text-center">更多方案</p>
                             <div class="tz-gallery">
                                <div class="row">
                                    <div class="col-md-12" >
                        <br />
<div class="tz-gallery">
                        <asp:DataList ID="DataList_Morecase"  runat="server" RepeatDirection="Horizontal" RepeatColumns="4">
                                 <ItemTemplate>
                                  <div class="thumbnail" style="margin-right: 20px">
                                                <div class="span3 element category01" data-category="category01" style="margin-left: 20px;">
                                                    <table class="nav-justified">
                                                        <tr>
                                                            <td>
                                                                <a href='gallery_2.aspx?fid=<%# Eval("fIdStores") %>&amp;sid=<%# Eval("fIdServices") %>'>
                                                                <asp:Image ID="Image3" runat="server"  ImageUrl='<%# Eval("fPhoto") %>'  Height="150px" style="background-size:contain;"/>
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
</asp:Content>



