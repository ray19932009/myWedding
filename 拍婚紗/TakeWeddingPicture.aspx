<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="TakeWeddingPicture.aspx.cs" Inherits="TakeWeddingPicture" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!--拍婚紗內容-->
     <div class="page_container">
    	<div class="breadcrumb"> 
        	<div class="wrap">
                <div class="container">
                     <a href="Default.aspx"><i class="icon-home"></i>首頁</a><span>/</span>拍婚紗
                </div>
            </div> 
        </div>
    	<!--MAIN CONTENT AREA-->
        <div class="wrap">
            <div class="container inner_content">
                <div id="options">                                           
                    <ul id="filters" class="option-set" data-option-key="filter">
                        <li><a href="#filter" data-option-value="*" class="btn dark_btn selected">婚紗全部</a></li>
                        <li><a href="#filter" data-option-value=".category02" class="btn dark_btn">婚紗包套</a></li>                                            
                        <li><a href="#filter" data-option-value=".category03" class="btn dark_btn">海外婚紗</a></li>
                        <li><a href="#filter" data-option-value=".category04" class="btn dark_btn">特色婚紗</a></li>
                        <li><a href="#filter" data-option-value=".category05" class="btn dark_btn">自助婚紗</a></li>
                    </ul>                                           
                    <div class="clear">
                        <asp:Panel ID="Panel1" runat="server">
                            <asp:DataList ID="DataList6" runat="server" RepeatColumns="3">
                                <ItemTemplate>
                                <img alt="" src='ImageHandler.ashx?Item_ID=<%# Eval("Item_ID") %>' style="height: 88px; width: 78px" />
                                </ItemTemplate> 
                                </asp:DataList>
                        </asp:Panel>
                    </div>
                </div>
                <div class="row">
                    <!-- portfolio_block -->
                   
                    <asp:Panel ID="Panel2" runat="server">
                        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                        <asp:LinkButton ID="lkfirst" runat="server" OnCommand="IndexChanging" CommandArgument="first">Frist</asp:LinkButton>
                        <asp:LinkButton ID="lkPre" runat="server" OnCommand="IndexChanging" CommandArgument="pre">Previous</asp:LinkButton>
                        <asp:LinkButton ID="lkNext" runat="server" OnCommand="IndexChanging" CommandArgument="next">Next</asp:LinkButton>
                        <asp:LinkButton ID="lklast" runat="server" OnCommand="IndexChanging" CommandArgument="last">Last</asp:LinkButton>
                    </asp:Panel>
                   
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:myWeddingConnectionString1 %>" SelectCommand="SELECT          *
FROM              tGallery AS a 
							INNER JOIN
                            tGalleryPhoto AS b
							ON 
							a.fIdGallery = b.fIdGallery 
							INNER JOIN
							tServicesSubClass as c 
							ON 
							c.fIdServicesSubClass = a.fIdServicesSubClass
							inner Join 
							tServicesClass as d
							ON 
							d.fIdServicesClass = c.fIdServicesClass
WHERE          (b.fcover = 'true' and c.fIdServicesClass = 1 and c.fIdServicesSubClass = 4)"></asp:SqlDataSource>      
      
                       <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:myWeddingConnectionString1 %>" SelectCommand="SELECT          *
FROM              tGallery AS a 
							INNER JOIN
                            tGalleryPhoto AS b
							ON 
							a.fIdGallery = b.fIdGallery 
							INNER JOIN
							tServicesSubClass as c 
							ON 
							c.fIdServicesSubClass = a.fIdServicesSubClass
							inner Join 
							tServicesClass as d
							ON 
							d.fIdServicesClass = c.fIdServicesClass
WHERE          (b.fcover = 'true' and c.fIdServicesClass = 1 and c.fIdServicesSubClass = 1)"></asp:SqlDataSource>
      
                       <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:myWeddingConnectionString1 %>" SelectCommand="SELECT          *
FROM              tGallery AS a 
							INNER JOIN
                            tGalleryPhoto AS b
							ON 
							a.fIdGallery = b.fIdGallery 
							INNER JOIN
							tServicesSubClass as c 
							ON  
							c.fIdServicesSubClass = a.fIdServicesSubClass
							inner Join 
							tServicesClass as d
							ON 
							d.fIdServicesClass = c.fIdServicesClass
WHERE          (b.fcover = 'true' and c.fIdServicesClass = 1 and c.fIdServicesSubClass = 2)"></asp:SqlDataSource>
      
                       <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:myWeddingConnectionString1 %>" SelectCommand="SELECT          *
FROM              tGallery AS a 
							INNER JOIN
                           tGalleryPhoto AS b
							ON 
							a.fIdGallery = b.fIdGallery 
							INNER JOIN
							tServicesSubClass as c 
							ON 
							c.fIdServicesSubClass = a.fIdServicesSubClass
							inner Join 
							tServicesClass as d
							ON 
							d.fIdServicesClass = c.fIdServicesClass
WHERE          (b.fcover = 'true' and c.fIdServicesClass = 1 and c.fIdServicesSubClass = 3)"></asp:SqlDataSource>
       
                    <div class="projects"> 
                                <!--1-->
                        <!--全部拍婚紗方案-->
                         <asp:DataList ID="DataList1" runat="server" DataKeyField="fIdGallery" RepeatDirection="Horizontal">
                             <EditItemStyle Font-Bold="False" Font-Italic="False" Font-Names="Bernard MT Condensed" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" />
                            <ItemTemplate>
                                
                                <div class="span3 element category01" data-category="category01" style="margin-left:20px;">
                                    <!--2-->
                                    
                                    <div class="hover_img">
                                       <!--3-->
                                         <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("fPhoto") %>' />
                                    
                                    </div>
                                       <!--3-->
                                    
                                    
                                    <div class="item_description">
                                       <!--4-->
                                            <h6><a href="single_portfolio.html">
                                            <asp:Label ID="fNameLabel" runat="server" Text='<%# Eval("fName") %>' />
                                        </a></h6>
                                        <div class="descr">
                                            <!--5-->
                                            <asp:Label ID="fDescriptionLabel" runat="server" Text='<%# Eval("fDescription") %>' />
                                        </div>
                                            <!--5-->
                                    </div>
                                       <!--4-->
                                </div>
                                    <!--2-->
                            </ItemTemplate>
                        </asp:DataList>
                         <!--全部拍婚紗方案-->
                         <!--婚紗包套-->
                       <asp:DataList ID="DataList2" runat="server" DataKeyField="fIdGallery" DataSourceID="SqlDataSource2" RepeatDirection="Horizontal">
                            <ItemTemplate>
                                
                                <div class="span3 element category02" data-category="category02" style="margin-left:20px;">
                                    <!--2-->
                                    
                                    <div class="hover_img">
                                       <!--3-->
                                         <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("fPhoto") %>' />
                                    
                                    </div>
                                       <!--3-->
                                    
                                    
                                    <div class="item_description">
                                       <!--4-->
                                            <h6><a href="single_portfolio.html">
                                           
                                                <asp:Label ID="fNameLabel" runat="server" Text='<%# Eval("fName") %>' />
                                           
                                        </a></h6>
                                        <div class="descr">
                                            <!--5-->
                                            <asp:Label ID="fDescriptionLabel" runat="server" Text='<%# Eval("fDescription") %>' />
                                        </div>
                                            <!--5-->
                                    </div>
                                       <!--4-->
                                </div>
                                    <!--2-->
                            </ItemTemplate>
                        </asp:DataList>   
                         <!--婚紗包套-->
                         <!--海外婚紗-->         
                         <asp:DataList ID="DataList3" runat="server" DataKeyField="fIdGallery" DataSourceID="SqlDataSource3" RepeatDirection="Horizontal">
                            <ItemTemplate>

                                <div class="span3 element category03" data-category="category03" style="margin-left:20px;">
                                    <!--2-->
                                    
                                    <div class="hover_img">
                                       <!--3-->
                                        <asp:Image ID="Image3" runat="server" ImageUrl='<%# Eval("fPhoto") %>' />
                                    
                                    </div>
                                       <!--3-->
                                    
                                    
                                    <div class="item_description">
                                       <!--4-->
                                            <h6><a href="single_portfolio.html">
                                           
                                                <asp:Label ID="fNameLabel" runat="server" Text='<%# Eval("fName") %>' />
                                           
                                        </a></h6>
                                        <div class="descr">
                                            <!--5-->
                                           <asp:Label ID="fDescriptionLabel" runat="server" Text='<%# Eval("fDescription") %>' />
                                        </div>
                                            <!--5-->
                                    </div>
                                       <!--4-->
                                </div>
                                    <!--2-->
                            </ItemTemplate>
                        </asp:DataList>    
                         <!--海外婚紗--> 
                         <!--特色婚紗-->       
                         <asp:DataList ID="DataList4" runat="server" DataKeyField="fIdGallery" DataSourceID="SqlDataSource4" RepeatDirection="Horizontal">
                            <ItemTemplate>

                                <div class="span3 element category04" data-category="category04" style="margin-left:20px;">
                                    <!--2-->
                                    
                                    <div class="hover_img">
                                       <!--3-->
                                        <asp:Image ID="Image3" runat="server" ImageUrl='<%# Eval("fPhoto") %>' />
                                    
                                    </div>
                                       <!--3-->
                                    
                                    
                                    <div class="item_description">
                                       <!--4-->
                                            <h6><a href="single_portfolio.html">
                                           
                                                <asp:Label ID="fNameLabel" runat="server" Text='<%# Eval("fName") %>' />
                                           
                                        </a></h6>
                                        <div class="descr">
                                            <!--5-->
                                           <asp:Label ID="fDescriptionLabel" runat="server" Text='<%# Eval("fDescription") %>' />
                                        </div>
                                            <!--5-->
                                    </div>
                                       <!--4-->
                                </div>
                                    <!--2-->
                            </ItemTemplate>
                        </asp:DataList>  
                         <!--特色婚紗-->  
                         <!--自助婚紗-->            
                         <asp:DataList ID="DataList5" runat="server" DataKeyField="fIdGallery" DataSourceID="SqlDataSource1" RepeatDirection="Horizontal">
                            <ItemTemplate>

                                <div class="span3 element category05" data-category="category05" style="margin-left:20px;">
                                    <!--2-->
                                    
                                    <div class="hover_img">
                                       <!--3-->
                                        <asp:Image ID="Image3" runat="server" ImageUrl='<%# Eval("fPhoto") %>' />
                                    
                                    </div>
                                       <!--3-->
                                    
                                    
                                    <div class="item_description">
                                       <!--4-->
                                            <h6><a href="single_portfolio.html">
                                           
                                                <asp:Label ID="fNameLabel" runat="server" Text='<%# Eval("fName") %>' />
                                           
                                        </a></h6>
                                        <div class="descr">
                                            <!--5-->
                                           <asp:Label ID="fDescriptionLabel" runat="server" Text='<%# Eval("fDescription") %>' />
                                        </div>
                                            <!--5-->
                                    </div>
                                       <!--4-->
                                </div>
                                    <!--2-->
                            </ItemTemplate>
                        </asp:DataList>            
                         <!--自助婚紗--> 


                  
                        
                        
                                

                    </div>

                        <!-- 測試1 -->
                 

                        <div class="clear">
                        </div>
                    </div>   
                    <!-- //portfolio_block -->   
                </div>
            </div>
        </div>
    <!--//MAIN CONTENT AREA-->
    	
    </div>
    <!--//page_container-->
  
</asp:Content>

