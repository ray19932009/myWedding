<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Chat.aspx.cs" Inherits="Chat" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="colinchat">
        <div class="colinchattitle"><h4>冠允公司<span class="pull-right"><i class="glyphicon glyphicon-remove"></i></span></h4>
            </div>
        <div class="colinchatbody"></div>
        <div class="colinchatfoot">
            <input type="text" placeholder="請輸入..."/>
            <a class="btn btn-large pull-right">送出</a>
        </div>
    </div>
        
</asp:Content>

