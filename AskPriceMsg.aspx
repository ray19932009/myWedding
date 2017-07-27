<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AskPriceMsg.aspx.cs" Inherits="AskPrice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css"/>
 <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.4/themes/trontastic/jquery-ui.css"/>
  <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
  <script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!--新人問報價內容-->
    <div class="breadcrumb">
        	<div class="wrap">
                <div class="container-fluid">
                    <a href="Default.aspx"><i class="icon-home"></i>首頁</a><span>/</span><a href="AskPrice.aspx">新人問報價</a><span>/</span>需求內容
                 
                    </div>
            </div> 
        </div>
       
      <div id="go" style="text-align:center;"> 
          <h3>請店家線上報價</h3>
          <asp:Button ID="Button1" runat="server" Text="免費詢問報價" CssClass="btn-lg btn-primary" OnClick="Button1_Click" />
      </div>
   <div class="container">
       <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
            <br />
       <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
            <div id="content3">
       
      </div>   
</div>


    
</asp:Content>

