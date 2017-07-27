<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="WeddingSite.aspx.cs" Inherits="WeddingSite" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <link href="css/Li-StoreInfo.css" rel="stylesheet" />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:myWeddingConnectionString %>" SelectCommand="select distinct b.fCity,b.fIdCity
from tStores as a 
inner join tCity as b on (a.fIdCity = b.fIdCity)
inner join tServices as c on a.fIdStores = c.fIdStores
 where c.fIdSubServicesClass=10"></asp:SqlDataSource>

    <!--婚宴場地內容-->
 
    <!-- 選擇各地區 -->


    <div class="page_container" style="background-color: rgba(0, 0, 0, 0.00);">
        <div class="breadcrumb">
            <div class="wrap">
                <div class="container-fluid">
                    <a href="Default.aspx"><i class="icon-home"></i>首頁</a><span>/</span>婚宴場地
                </div>
            </div>
        </div>
        <!--MAIN CONTENT AREA-->
        <div class="wrap">
            <div class="container inner_content">
                <div id="options">
                    <ul id="filters" data-option-key="filter">
                        <li><a href="WeddingSite.aspx?subClass=0" class="btn dark_btn liselected">
                            <asp:Label ID="Label4" runat="server" Text="作品集"></asp:Label></a></li>
                         <li style="margin-right:70%"><a href="WeddingSiteCase.aspx?subClass=0" class="btn dark_btn ">
                            <asp:Label ID="Label6" runat="server" Text="方案"></asp:Label></a> </li>
                             <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" EnableViewState="false" AutoPostBack="True" Width="186px" CssClass="btn btn-large" Height="100%">
                            <asp:ListItem Value="1">更新時間&#11015;</asp:ListItem>
                            <asp:ListItem Value="2">人氣&#11015;</asp:ListItem>                     
                            </asp:DropDownList>
                    </ul>
                    <ul id="filters" data-option-key="filter">
                      <li> <a href="WeddingSite.aspx" data-site='0' class="btn dark_btn <%=allsite%>">全部地區</a> </li>
                     <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource1" RepeatColumns="10" RepeatDirection="Horizontal" DataKeyField="fIdCity">
                        <ItemTemplate>
                           <li> <a data-site='<%# Eval("fIdCity")%>' href="WeddingSite.aspx?siteId=<%# Eval("fIdCity") %>" class="btn dark_btn <%#Convert.ToInt32(Request["siteId"])==Convert.ToInt32(Eval("fIdCity"))?"liselected":"" %>" >
                                <asp:Label ID="fCityLabel" runat="server" Text='<%# Eval("fCity") %>' />
                            </a></li>
                            &nbsp;&nbsp;
                        </ItemTemplate>
                    </asp:DataList>
                    </ul>
                    <div class="clear">
                    </div>
                </div>
                <div class="tz-gallery1">
                    <div class="container gallery-container">
                        <div class="row">
                            <div class="col-md-12">
                                <!-- portfolio_block -->
                                <div class="projects">
                                      <asp:DataList ID="DataList1" runat="server" RepeatDirection="Horizontal" RepeatColumns="4">
                                        <ItemTemplate>
                                         <div class="thumbnail" style="margin-right: 20px">
                                            <div class="span3 element category01" data-category="category01" style="margin-left: 20px;">
                                                    <table class="nav-justified">
                                                        <tr>
                                                            <td>
                                                                <a href='gallery_1.aspx?fid=<%# Eval("fIdStores")%>&amp;gid=<%# Eval("fIdGallery") %>'>
                                                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("f作品集照片") %>' style="background-size:contain;" Height="150px" />
                                                                </a></td>

                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <div style="margin: 2%; border-radius: 10px; background-color: antiquewhite; padding: 5%;">
                                                                    <table class="nav-justified">
                                                                        <tr>
                                                                            <td>
                                                                                <asp:Label ID="Label15" runat="server" Font-Names="微軟正黑體" Font-Size="Large" Style="font-weight: bold;" Text='<%# Eval("f作品集名稱") %>'></asp:Label>
                                                                            </td>
                                                                            <td>&nbsp;</td>
                                                                        </tr>
                                                                 
                                                                        <tr>
                                                                            <td>
                                                                                <asp:Label ID="Label18" runat="server" Font-Names="微軟正黑體" Font-Size="X-Small" ForeColor="#999999" Text='<%# Eval("f作品集描述") %>'></asp:Label>
                                                                            </td>
                                                                            <td>&nbsp;</td>
                                                                        </tr>

                                                                        <tr>

                                                                            <td>
                                                                                <hr style="margin: 0 0 10px 0; padding: 0;" />
                                                                                <a href='StoreInfo.aspx?fid=<%# Eval("fIdStores") %>'>
                                                                                    <asp:Image ID="Image5" runat="server" Height="32px" ImageUrl='<%# Eval("f大頭照") %>' Style="border-radius: 43px; display: inline-block; width: 32px;" />
                                                                                    <asp:Label ID="Label6" runat="server" Font-Bold="true" Text='<%# Eval("f廠商名稱") %>'></asp:Label>
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
                                              </div>
                                        </ItemTemplate>
                                    </asp:DataList>

                                     <asp:DataList ID="DataList111" runat="server" RepeatDirection="Horizontal" RepeatColumns="4">
                                        <ItemTemplate>
                                            <div class="thumbnail" style="margin-right: 20px">
                                            <div class="span3 element category01" data-category="category01" style="margin-left: 20px;">
                                                    <table class="nav-justified">
                                                        <tr>
                                                            <td>
                                                                <a href='gallery_1.aspx?fid=<%# Eval("fIdStores")%>&amp;gid=<%# Eval("fIdGallery") %>'>
                                                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("f作品集照片") %>' style="background-size:contain;" Height="150px" />
                                                                </a></td>

                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <div style="margin: 2%; border-radius: 10px; background-color: antiquewhite; padding: 5%;">
                                                                    <table class="nav-justified">
                                                                        <tr>
                                                                            <td>
                                                                                <asp:Label ID="Label15" runat="server" Font-Names="微軟正黑體" Font-Size="Large" Style="font-weight: bold;" Text='<%# Eval("f作品集名稱") %>'></asp:Label>
                                                                            </td>
                                                                            <td>&nbsp;</td>
                                                                        </tr>
                                                                 
                                                                        <tr>
                                                                            <td>
                                                                                <asp:Label ID="Label18" runat="server" Font-Names="微軟正黑體" Font-Size="X-Small" ForeColor="#999999" Text='<%# Eval("f作品集描述") %>'></asp:Label>
                                                                            </td>
                                                                            <td>&nbsp;</td>
                                                                        </tr>

                                                                        <tr>

                                                                            <td>
                                                                                <hr style="margin: 0 0 10px 0; padding: 0;" />
                                                                                <a href='StoreInfo.aspx?fid=<%# Eval("fIdStores") %>'>
                                                                                    <asp:Image ID="Image5" runat="server" Height="32px" ImageUrl='<%# Eval("f大頭照") %>' Style="border-radius: 43px; display: inline-block; width: 32px;" />
                                                                                    <asp:Label ID="Label6" runat="server" Font-Bold="true" Text='<%# Eval("f廠商名稱") %>'></asp:Label>
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
         <li><asp:LinkButton ID="lkfirst" runat="server" >第一頁</asp:LinkButton></li>

      
        <li>&nbsp;&nbsp;<asp:LinkButton ID="lkPre" runat="server" >上一頁</asp:LinkButton></li>

         <li > <asp:Label ID="Label5" runat="server" ForeColor="DimGray">1</asp:Label></li>

       <%-- <li> <asp:Label ID="Label2" runat="server"  ForeColor="DimGray" ></asp:Label></li>--%>
       

        <li><asp:LinkButton ID="lkNext"  runat="server">下一頁</asp:LinkButton></li>

        &nbsp;
        
        <li><asp:LinkButton ID="lklast"  runat="server">最後一頁</asp:LinkButton></li>
        </ul>
       </nav>
        <!--//page_container-->
    </div>
</asp:Content>

