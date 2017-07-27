<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="forum.aspx.cs" Inherits="WeddingSite" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css"/>
    <style type="text/css">
        .auto-style1 {
            font-size: medium;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

       <div class="breadcrumb">
        	<div class="wrap">
                <div class="container-fluid">
                    <a href="Default.aspx"><i class="icon-home"></i>首頁</a><span>/</span>討論區
                 
                    </div>
            </div> 
        </div>
    <asp:Label ID="lblTitle" runat="server" style="font-size: x-large; color: #FF0000" Text=""></asp:Label>
    <br />
  
    <br />
    <div id="content3">
        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
        </div>
    <br />
    <br />
    <br />

    <div  align="center" >
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional"><ContentTemplate>
               
        <div align="center" >
            <br />
        <asp:Label ID="lblMessage" runat="server" style="font-size: x-large; color: #FF0000" Text="Label"></asp:Label>
         
            <br />
    </div>
        
          
        <div align="center" >

            <asp:FormView ID="FormView1" runat="server" DataKeyNames="fIdTitle" OnItemInserting="FormView1_ItemInserting" DataSourceID="LinqDataSource1" DefaultMode="Insert" OnItemInserted="FormView1_ItemInserted">
            <EditItemTemplate>
                fIdTitle:
                <asp:Label ID="fIdTitleLabel1" runat="server" Text='<%# Eval("fIdTitle") %>' />
                <br />
                fTitle:
                <asp:TextBox ID="fTitleTextBox" runat="server" Text='<%# Bind("fTitle") %>' />
                <br />
                fContent:
                <asp:TextBox ID="fContentTextBox" name="fContent" runat="server" Text='<%# Bind("fContent") %>' />
                <br />
                fSendTime:
                <asp:TextBox ID="fSendTimeTextBox" runat="server" Text='<%# Bind("fSendTime") %>' />
                <br />
                fIdMember:
                <asp:TextBox ID="fIdMemberTextBox" runat="server" Text='<%# Bind("fIdMember") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="更新" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
            </EditItemTemplate>
            <InsertItemTemplate>
                <span class="auto-style1">主題:</span><br />
                <asp:TextBox ID="fTitleTextBox" runat="server" Text='<%# Bind("fTitle") %>' Height="44px" Width="853px" Font-Size="20px" />
                <br />
                <span class="auto-style1">文章內容:<br /></span>&nbsp;
                <textarea name="teatarea1" style="height:319px;width:875px;Font-Size:18px;"></textarea>
            
                <br />

                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" CssClass="auto-style1" Text="發佈" style="font-size: large" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="auto-style1" Text="取消" style="font-size: large" />
            </InsertItemTemplate>
            
            <ItemTemplate>
                <asp:LinkButton ID="NewButton" runat="server" BackColor="White" CausesValidation="False" CommandName="New" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="24px" Font-Strikeout="False" Text="發文" />
            </ItemTemplate>
            
        </asp:FormView>
            </ContentTemplate></asp:UpdatePanel>
            <br />
            <br />
            <br />
            <br />
            <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="FactoryDBDataContext" EnableInsert="True" EntityTypeName="" TableName="tDiscussion">
            </asp:LinqDataSource>
            <br />
            <br />
            <br />
            <br />
    </div>
    <br />
        
        
</asp:Content>

