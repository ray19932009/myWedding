<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="forumMsg.aspx.cs" Inherits="WeddingSite" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <link rel="stylesheet" href="http://fontawesome.io/assets/font-awesome/css/font-awesome.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="breadcrumb">
        	<div class="wrap">
                <div class="container-fluid">
                    <a href="Default.aspx"><i class="icon-home"></i>首頁</a><span>/</span><a href="forum.aspx">討論區列表</a><span>/</span>討論串
                 
                     
                    <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="FactoryDBDataContext" EnableInsert="True" EntityTypeName="" TableName="tDiscussionReply" Where="fIdTitle == @fIdTitle">
                        <WhereParameters>
                            <asp:QueryStringParameter Name="fIdTitle" QueryStringField="fIdTitle" Type="Int32" />
                        </WhereParameters>
                    </asp:LinqDataSource>
                 
                    </div>
            </div> 
        </div>
       

     <div class="container">
        <br />
        <br />
        <br />
        <asp:Label ID="Label12" runat="server" Text=""></asp:Label>
     

   
      
           <asp:Label ID="Label13" runat="server" Text=""></asp:Label>
    
        </div>
     
    <br />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional"><ContentTemplate>
    <div class="container">
            
               <asp:Label ID="lblMsg" runat="server" style="font-size: x-large; color: #FF0000" Text="Label"></asp:Label>
       
            <br />
        
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="fIdDiscussionReply" DefaultMode="Insert" OnItemInserting="FormView1_ItemInserting" OnItemInserted="FormView1_ItemInserted" DataSourceID="LinqDataSource1">
                <EditItemTemplate>
                    fIdDiscussionReply:
                    <asp:Label ID="fIdDiscussionReplyLabel1" runat="server" Text='<%# Eval("fIdDiscussionReply") %>' />
                    <br />
                    fIdTitle:
                    <asp:TextBox ID="fIdTitleTextBox" runat="server" Text='<%# Bind("fIdTitle") %>' />
                    <br />
                    fIdMember:
                    <asp:TextBox ID="fIdMemberTextBox" runat="server" Text='<%# Bind("fIdMember") %>' />
                    <br />
                    fSendTime:
                    <asp:TextBox ID="fSendTimeTextBox" runat="server" Text='<%# Bind("fSendTime") %>' />
                    <br />
                    fContent:
                    <asp:TextBox ID="fContentTextBox" runat="server" Text='<%# Bind("fContent") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="更新" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    <div class="container">
                        <div class="row">
                            <div class="panel panel-default widget">
                                <div class="panel-heading">
                                    <span class="glyphicon glyphicon-comment"></span>
                                    <h3 class="panel-title">回覆</h3>
                                </div>
                                <div class="col">
                                    <div class="panel-body">
                                        <fieldset>
                                            <div class="form-group">
                                                
                                                <textarea name="msg" style="height:194px;width:1079px;"></textarea>
                                                <br />
                                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="回覆" Font-Size="20px" />
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" Font-Size="20px" />
                                            </div>
                                        </fieldset></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br />
                    <br />
                    &nbsp;
                </InsertItemTemplate>
                <ItemTemplate>
                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="回覆" />
                </ItemTemplate>
            </asp:FormView>
            <br />
         </div>
              </ContentTemplate></asp:UpdatePanel>
    <br />
    <br />
    <br />
    
     
</asp:Content>

