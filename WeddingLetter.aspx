<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="WeddingLetter.aspx.cs" Inherits="Letter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!--連結導航-->
    <div class="breadcrumb">
        	<div class="wrap">
                <div class="container">
                    <a href="Default.aspx"><i class="icon-home"></i>首頁</a><span>/</span>站內信
                 
                    </div>
            </div> 
        </div>
    <!--END 連結導航-->
    <div class="lettercontent container">  
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>   
        </div>
</asp:Content>

