<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="WeddingError.aspx.cs" Inherits="WeddingError" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
        <img style="border-radius:20px;" src="img/error.jpg"/>
        <h1>發生了不可預期的錯誤<br/>
        沒有為什麼！
    </h1>
    <input style="margin-bottom:20px;" class="btn-success btn-large" type ="button" onclick="history.back()" value="回到上一頁"/></center>
</asp:Content>

